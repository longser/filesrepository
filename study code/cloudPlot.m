function [] = cloudPlot(X, Y, limx,limy,xlabelstr,ylabelstr,ftitlestr,nSample)
%CLOUDPLOT Does a cloud plot of the data in X and Y.
% CLOUDPLOT(X,Y) draws a cloudplot of Y versus X. A cloudplot is in essence
% a 2 dimensional histogram showing the density distribution of the data
% described by X and Y. As the plot displays density information, the
% dimensionality of X and Y are ignored. The only requirement is that X and
% Y have the same number of elements. Cloudplot is written to visualize
% large quantities of data and is most appropriate for datasets of 10000
% elements or more.
%
% CLOUDPLOT(X,Y,binSize) will use the binSize to set the size of the bins
% over which the density of the data is measured. If binSize is a scalar,
% it is used for both X and Y. If it is a 2-element vector, the first
% element will be the bin size in X and the second element will be the bin
% size i Y.
%
% h = CLOUTPLOT(...) returns the handle to the cloud image in h.
%
% Example:
%   cloudPlot( randn(100,1), randn(100,1) );
%    Will plot a Gaussian scattered distribution using a default bin-size.
%
%   cloudPlot( randn(100), randn(100), [0.1 0.1] );
%    Will plot a Gaussian scattered distribution using bins that are
%    0.1x0.1 units large.

% Remove NaNs and Infs as they have no meaning in this sort of plot.
%% debug
% X=sill;
% Y=err;
% limx=[0,0.12];
% limy=[-0.1,0.6];
% xlabelstr='sill';
% ylabelstr='error';
% ftitlestr='sill-error';
% nSample=length(inx);
%%
month_ = 0;

selectNanAndInf = or(or(or(isnan(X),isnan(Y)),isinf(X)),isinf(Y));

nn = 3;

X = real(X(~selectNanAndInf));
Y = real(Y(~selectNanAndInf));

if ( nargin < 3 )
    %Do an automatic estimate to get 5 points per bin on average.
    binSize = ...
        5/sqrt((numel(X)/((max(X(:))-min(X(:)))*(max(Y(:))-min(Y(:))))));
    binSize = [binSize binSize];
end

% Check the data size
assert ( numel(X) == numel(Y), ...
    'The number of elements in X and Y must be the same.' );

% Fix if only one binSize is given.
% lim = [max(limx(1),limy(1)),min(limx(2),limy(2))]
binSize = [(limx(2) - limx(1)) / 300 (limy(2) - limy(1)) / 300]
if ( numel(binSize) == 1 )
    binSize = [binSize binSize]
end

assert ( numel(binSize)==2, 'binSize must be a 2-element vector.' );

% Plot to get appropriate limits

% set(gcf,'Visible','off')
h = plot ( X(:), Y(:), '.' );
g = get( h, 'Parent' );
xlim(limx)
ylim(limy)
xLim = get(g, 'Xlim' );
yLim = get(g, 'Ylim' );
xTick = get(g, 'XTick' );
xTickLabel = get(g, 'XTickLabel' );
yTick = get(g, 'YTick' );
yTickLabel = get(g, 'YTickLabel' );

% Allocate an area to draw on
bins = ceil([diff(xLim)/binSize(1) diff(yLim)/binSize(2)]);
canvas = zeros(bins);

% Draw in the canvas
xBinIndex = floor((X - xLim(1))/binSize(1))+1;
xBinIndex(xBinIndex <= 0) = 1;
xBinIndex(xBinIndex > length(canvas)) = length(canvas);
yBinIndex = floor((Y - yLim(1))/binSize(2))+1;
yBinIndex(yBinIndex <= 0) = 1;
yBinIndex(yBinIndex > length(canvas)) = length(canvas);
didx = cell(100);
for i = 1:numel(xBinIndex);
    if mod(i, 10000) == 0
%         fprintf('%d\t%f\n', i, i / numel(xBinIndex))
    end
    canvas(xBinIndex(i),yBinIndex(i)) = ...
        canvas(xBinIndex(i),yBinIndex(i)) + 1;
    
%     eval(['didx_', num2str(ceil(xBinIndex(i) / nn)), '_', num2str(ceil(yBinIndex(i) / nn)), ' = [];']);
%     eval(['didx_', num2str(ceil(xBinIndex(i) / nn)), '_', num2str(ceil(yBinIndex(i) / nn)), ...
%          '= [didx_', num2str(ceil(xBinIndex(i) / nn)), '_', num2str(ceil(yBinIndex(i) / nn)), ', i];';]);
%     if type == 1
%         didx{ceil(xBinIndex(i) / nn), ceil(yBinIndex(i) / nn)} = ...
%             [didx{ceil(xBinIndex(i) / nn), ceil(yBinIndex(i) / nn)}, i];
%     end
end

% Show the canvas and adjust the grids.

% if type == 1
%     tcanvas = imresize(canvas, 1/nn, 'nearest');
%     temp = sort(reshape(tcanvas, 1, []), 'descend');
%     tempsum = sum(sum(temp)) * 0.70;
%     for ii = 1:numel(temp)
%         if sum(temp(1:ii)) > tempsum
%             ni = ii;
%             break;
%         end
%     end
%     tempdata = tcanvas(tcanvas <= temp(ni));
%     idx = [];
%     for ii = 1:numel(tempdata)
% %         fprintf('%d\t%f\n', ii, ii / numel(tempdata))
%         if tempdata(ii) ~= 0
%             [idxx, idxy] = find(tcanvas == tempdata(ii));
%             for jj = 1:numel(idxx)
% %                 fprintf('%d\t%f\n', jj, jj / numel(idxx))
%                 if ~isempty(didx{ceil(idxx(jj)), ceil(idxy(jj))})
%                     X(didx{ceil(idxx(jj)), ceil(idxy(jj))}) = nan;
%                     Y(didx{ceil(idxx(jj)), ceil(idxy(jj))}) = nan;
%                 end
%             end
%         end
%     end
%     X(isnan(X)) = [];
%     Y(isnan(Y)) = [];
%     
%     canvas(canvas <= temp(ni)) = NaN;
% end

canvas1 = interp2(canvas);
canvas2 = canvas1;

[a, ~] = size(canvas1);
for ii = 1:2:a
%     if canvas1(ii, ii) == 0
        canvas1(ii, ii) = max(max(canvas1));
%     end
end
clf
% figure(2)
h = imagesc (log(canvas1)' );
% set(h, 'Visable', 'on')
% h = imagesc ( (canvas)' );
axis ( 'xy' );
g = get( h, 'Parent' );
xTickAdjust = (xTick - min(xTick))*bins(1)/(max(xTick)-min(xTick))+0.3;
yTickAdjust = (yTick - min(yTick))*bins(2)/(max(yTick)-min(yTick))+0.3;
rt = length(canvas1) / length(canvas) * 0.999;
set ( g, 'XTick', xTickAdjust * rt );
set ( g, 'XTickLabel', xTickLabel );
set ( g, 'YTick', yTickAdjust * rt);
set ( g, 'YTickLabel', yTickLabel );

% set ( g, 'XTick', xTickAdjust * rt);
% set ( g, 'XTickLabel', xTickLabel );
% set ( g, 'YTick', yTickAdjust * rt);
% set ( g, 'YTickLabel', yTickLabel );
hold on
% plot([limx(1), limx(2)], [limy(1), limy(2)])
hold off
% Optionally return a handle
if ( nargout > 0 )
    varargout{1} = h;
end
cmbr = ones(256, 3);
cmbr(2:128, 1:2) = repmat((0:1/127:126/127)', 1, 2);
cmbr(129:255, 2:3) = repmat((126/127:-1/127:0)', 1, 2);
cmrb = ones(256, 3);
cmrb(2:128, 2:3) = repmat((0:1/127:126/127)', 1, 2);
cmrb(129:255, 1:2) = repmat((126/127:-1/127:0)', 1, 2);

cmwb = cmrb(129:255, :);
cmrw = cmrb(1:128, :);
cmwr = cmbr(129:255, :);
cmbw = cmbr(1:128, :);

colormap([1, 1, 1; jet])
% colormap(flipud(gray))
% colormap(flipud(hot))
% colormap(flipud(bone))
% colormap([1, 1, 1; flipud(summer)])
% colormap([1, 1, 1; flipud(autumn)])
% colormap(cmwb)

axis square
[r, ~] = corrcoef(X, Y);
r = r(2);
% text(length(canvas1) * 0.05, length(canvas1) * 0.95, ['Samples = ', num2str(numel(X))]);
[p, ~] = polyfit(X, Y, 1);
% text(length(canvas1) * 0.05, length(canvas1) * 0.9, ...
%     ['y = ax + b, a = ', sprintf('%.3f', p(1)), ', b = ', sprintf('%.3f', p(2))]);
% % % text(length(canvas1) * 0.05, length(canvas1) * 0.85, ['R2 = ', sprintf('%.3f', r*r)]);
% % % rmse = sqrt(sum((X - Y).^2)/length(X));
% % % text(length(canvas1) * 0.05, length(canvas1) * 0.8, ['RMSD = ', sprintf('%.3f', rmse)]);
% % % bias = mean(Y) - mean(X);
% % % text(length(canvas1) * 0.05, length(canvas1) * 0.75, ['Bias = ', sprintf('%.3f', bias)]);
% % % text(length(canvas1) * 0.05, length(canvas1) * 0.70, ['Samples = ', sprintf('%u', nSample)]);

% xlabel(inputname(1))
% ylabel(inputname(2))

xlabel(xlabelstr)
ylabel(ylabelstr)

% if month_ ~= 0
%     tmpstr = datestr(datenum(2006, month_, 1));
%     tmpstr = [inputname(1), '-', inputname(2), '-', tmpstr(4:6)];
% else
%     tmpstr = [inputname(1), '-', inputname(2), '-Clr'];
% end
title(ftitlestr)

set(gcf, 'color', 'w')
set(gcf,'Position',[200, 200, 300, 300], 'color','w')
A = getframe(gcf);
% imwrite(A.cdata, ['E:\Bak_important\zy\2012_13\toaabd\fig\', tmpstr, '.png'])