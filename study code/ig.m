linewidth_line = 1;      % 图形线条宽度
linewidth_gca = 0.7;      % 横纵坐标轴宽度
fontsize_gca = 7;           % 横纵坐标轴刻度字体大小
fontsize_label = 9;         % 横纵坐标轴字体大小
fontSize_number = 8.5;
ne=[800:50:2200];
v=[0:2:40];
figure(1)
set(gcf,'unit','centimeters','position',[20,10,10,7.5])  
x=[0:0.05:1];
ne=-210.*x.*x.*x.*x-150.*x.*x.*x+810.*x.*x+1000.*x+750;
[X,Y]=meshgrid(ne,v)
Z=X.*0.75.*0.377./(23.06.*Y);
Z(Z>=4.33)=4.33;
Z(Z<=0.63)=0.63;


surf(x,Y,Z);
% xlabel('Engine speed(rpm)','FontWeight','bold');
% ylabel('Vehicle speed(km/h)','FontWeight','bold');
% zlabel('transmission ratio','FontWeight','bold');
xlabel('节气门开度(-)')
ylabel('拖拉机速度(km/h)')
zlabel('传动比(-)');
set(gca,'Fontname');
set(gca,'FontSize',fontSize_number);

% v=[0:1:40];
% ne=[800:50:2200];
% [V,NE]=meshgrid(v,ne);
% ig=0.377.*NE.*0.75./(6.4*3.7.*V);
% ig(ig>=4.33)=4.33;
% ig(ig<=0.63)=0.63;
% mesh(V,NE,ig);
% e=1;
% ne=[800:10:2200];
% te=[0:10:400];
% [X,Y]=meshgrid(ne,te)
% x=0.87.*((X/(0.62*3900)).^(0.05)+0.035*sin(4*X/(0.62*3900))).*(exp(-3.3.*Y/(55*42))-exp(-5.*Y/(55*42))+exp(0.05.*Y/(55*42)))*(abs(e)^0.5);
% y=0.87.*((e*X/(0.62*3490)).^(0.05)+0.035*sin(4*e*X/(0.62*3490))).*(exp(-3.3.*Y/(55*42))-exp(-5.*Y/(55*42))+exp(0.05.*Y/(55*42)));
% Z=x.*y;
% mesh(X,Y,real(Z));
