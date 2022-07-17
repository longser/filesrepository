linewidth_line = 1;      % 图形线条宽度
linewidth_gca = 0.7;      % 横纵坐标轴宽度
fontsize_gca = 7;           % 横纵坐标轴刻度字体大小
fontsize_label = 9;         % 横纵坐标轴字体大小
fontSize_number = 8.5;
figure(1)
set(gcf,'unit','centimeters','position',[20,10,10,7.5]) 
e=0;
k1=1.8;
k2=1.6;
i1=0.62;
i2=1;
x=[0:30:370];%单位N/m
y=[800:50:2200];%单位r/min
[X,Y]=meshgrid(x,y)
npmax=3900;%单位r/min
nmmax=3490;%单位r/min
dmmax=55;%单位cm3/r
ppmax=42;%单位Mpa
pmmax=42;%单位Mpa
iic=((1+k2)./(e./(i1.*i2)+k2.*((1+k1)./k1)));
icia=(e./((1+k2).*i1.*i2));
icib=((k2.*(1+k1))./((1+k2).*k1));
icab=(k2./(1+k2));
ici=icia+icib;
yp=0.87.*[(Y./(i1.*npmax)).^0.05+0.035.*sin(4.*Y./(i1.*npmax))].*[exp(-3.3.*X/(dmmax* ppmax))-exp(-5.*X/( dmmax * ppmax))+exp(0.05.*X/( dmmax * ppmax))].*abs(e).^0.5;
ym=0.87.*[(e.*Y./(i1.*nmmax)).^0.05+0.035*sin(4.*e.*Y/(i1.*nmmax))] .*[exp(-3.3.*X/(dmmax* pmmax))-exp(-5.*X/( dmmax * pmmax))+exp(0.05.*X/( dmmax * pmmax))];
z=abs(yp.*ym);
Z=0.95+z;
surf(X,Y,Z)
hold on;
e=0.6;
k1=1.8;
k2=1.6;
i1=0.62;
i2=1;
x=[0:30:370];%单位N/m
y=[800:50:2200];%单位r/min
[X,Y]=meshgrid(x,y)
npmax=3900;%单位r/min
nmmax=3490;%单位r/min
dmmax=55;%单位cm3/r
ppmax=42;%单位Mpa
pmmax=42;%单位Mpa
iic=((1+k2)./(e./(i1.*i2)+k2.*((1+k1)./k1)));
icia=(e./((1+k2).*i1.*i2));
icib=((k2.*(1+k1))./((1+k2).*k1));
icab=(k2./(1+k2));
ici=icia+icib;
yp=0.87.*[(Y./(i1.*npmax)).^0.05+0.035.*sin(4.*Y./(i1.*npmax))].*[exp(-3.3.*X/(dmmax* ppmax))-exp(-5.*X/( dmmax * ppmax))+exp(0.05.*X/( dmmax * ppmax))].*abs(e).^0.5;
ym=0.87.*[(e.*Y./(i1.*nmmax)).^0.05+0.035*sin(4.*e.*Y/(i1.*nmmax))] .*[exp(-3.3.*X/(dmmax* pmmax))-exp(-5.*X/( dmmax * pmmax))+exp(0.05.*X/( dmmax * pmmax))];
Z=abs(yp.*ym);
y2=[(1+abs(iic).*(abs(icib-icab.*ici)*0.019+abs(icia).*(1./(0.98*0.98*Z)-1))).^(-1)]*0.95;%不存在功率循环计算
surf(X,Y,y2)
hold on;
e=-0.6;
k1=1.8;
k2=1.6;
i1=0.62;
i2=1;
x=[0:30:370];%单位N/m
y=[800:50:2200];%单位r/min
[X,Y]=meshgrid(x,y)
npmax=3900;%单位r/min
nmmax=3490;%单位r/min
dmmax=55;%单位cm3/r
ppmax=42;%单位Mpa
pmmax=42;%单位Mpa
iic=((1+k2)./(e./(i1.*i2)+k2.*((1+k1)./k1)));
icia=(e./((1+k2).*i1.*i2));
icib=((k2.*(1+k1))./((1+k2).*k1));
icab=(k2./(1+k2));
ici=icia+icib;
yp=0.87.*[(Y./(i1.*npmax)).^0.05+0.035.*sin(4.*Y./(i1.*npmax))].*[exp(-3.3.*X/(dmmax* ppmax))-exp(-5.*X/( dmmax * ppmax))+exp(0.05.*X/( dmmax * ppmax))].*abs(e).^0.5;
ym=0.87.*[(e.*Y./(i1.*nmmax)).^0.05+0.035*sin(4.*e.*Y/(i1.*nmmax))] .*[exp(-3.3.*X/(dmmax* pmmax))-exp(-5.*X/( dmmax * pmmax))+exp(0.05.*X/( dmmax * pmmax))];
Z=abs(yp.*ym);
y1=[(1+abs(iic).*(abs(icib-icab.*ici)*0.019+abs(icia).*(1-0.98*0.98*Z))).^(-1)]*0.95;%存在功率循环计算
surf(X,Y,y1);
hold on;
e=0.6;
k1=1.8;
k2=1.6;
i1=0.62;
i2=1;
x=[0:30:370];%单位N/m
y=[800:50:2200];%单位r/min
[X,Y]=meshgrid(x,y)
npmax=3900;%单位r/min
nmmax=3490;%单位r/min
dmmax=55;%单位cm3/r
ppmax=42;%单位Mpa
pmmax=42;%单位Mpa
iic=((1+k2)./(e./(i1.*i2)+k2.*((1+k1)./k1)));
icia=(e./((1+k2).*i1.*i2));
icib=((k2.*(1+k1))./((1+k2).*k1));
icab=(k2./(1+k2));
ici=icia+icib;
yp=0.87.*[(Y./(i1.*npmax)).^0.05+0.035.*sin(4.*Y./(i1.*npmax))].*[exp(-3.3.*X/(dmmax* ppmax))-exp(-5.*X/( dmmax * ppmax))+exp(0.05.*X/( dmmax * ppmax))].*abs(e).^0.5;
ym=0.87.*[(e.*Y./(i1.*nmmax)).^0.05+0.035*sin(4.*e.*Y/(i1.*nmmax))] .*[exp(-3.3.*X/(dmmax* pmmax))-exp(-5.*X/( dmmax * pmmax))+exp(0.05.*X/( dmmax * pmmax))];
Z=abs(yp.*ym);
y2=[(1+abs(iic).*(abs(icib-icab.*ici)*0.019+abs(icia).*(1./(0.98*0.98*Z)-1))).^(-1)]*0.95;%不存在功率循环计算
surf(X,Y,y2)
hold on;
e=-0.6;
k1=1.8;
k2=1.6;
i1=0.62;
i2=1;
x=[0:30:370];%单位N/m
y=[800:50:2200];%单位r/min
[X,Y]=meshgrid(x,y)
npmax=3900;%单位r/min
nmmax=3490;%单位r/min
dmmax=55;%单位cm3/r
ppmax=42;%单位Mpa
pmmax=42;%单位Mpa
iic=((1+k2)./(e./(i1.*i2)+k2.*((1+k1)./k1)));
icia=(e./((1+k2).*i1.*i2));
icib=((k2.*(1+k1))./((1+k2).*k1));
icab=(k2./(1+k2));
ici=icia+icib;
yp=0.87.*[(Y./(i1.*npmax)).^0.05+0.035.*sin(4.*Y./(i1.*npmax))].*[exp(-3.3.*X/(dmmax* ppmax))-exp(-5.*X/( dmmax * ppmax))+exp(0.05.*X/( dmmax * ppmax))].*abs(e).^0.5;
ym=0.87.*[(e.*Y./(i1.*nmmax)).^0.05+0.035*sin(4.*e.*Y/(i1.*nmmax))] .*[exp(-3.3.*X/(dmmax* pmmax))-exp(-5.*X/( dmmax * pmmax))+exp(0.05.*X/( dmmax * pmmax))];
Z=abs(yp.*ym);
y1=[(1+abs(iic).*(abs(icib-icab.*ici)*0.019+abs(icia).*(1-0.98*0.98*Z))).^(-1)]*0.95;%存在功率循环计算
surf(X,Y,y1);
hold on;
e=0.8;
k1=1.8;
k2=1.6;
i1=0.62;
i2=1;
x=[0:30:370];%单位N/m
y=[800:50:2200];%单位r/min
[X,Y]=meshgrid(x,y)
npmax=3900;%单位r/min
nmmax=3490;%单位r/min
dmmax=55;%单位cm3/r
ppmax=42;%单位Mpa
pmmax=42;%单位Mpa
iic=((1+k2)./(e./(i1.*i2)+k2.*((1+k1)./k1)));
icia=(e./((1+k2).*i1.*i2));
icib=((k2.*(1+k1))./((1+k2).*k1));
icab=(k2./(1+k2));
ici=icia+icib;
yp=0.87.*[(Y./(i1.*npmax)).^0.05+0.035.*sin(4.*Y./(i1.*npmax))].*[exp(-3.3.*X/(dmmax* ppmax))-exp(-5.*X/( dmmax * ppmax))+exp(0.05.*X/( dmmax * ppmax))].*abs(e).^0.5;
ym=0.87.*[(e.*Y./(i1.*nmmax)).^0.05+0.035*sin(4.*e.*Y/(i1.*nmmax))] .*[exp(-3.3.*X/(dmmax* pmmax))-exp(-5.*X/( dmmax * pmmax))+exp(0.05.*X/( dmmax * pmmax))];
Z=abs(yp.*ym);
y2=[(1+abs(iic).*(abs(icib-icab.*ici)*0.019+abs(icia).*(1./(0.98*0.98*Z)-1))).^(-1)]*0.95;%不存在功率循环计算
surf(X,Y,y2)
hold on;
e=-0.8;
k1=1.8;
k2=1.6;
i1=0.62;
i2=1;
x=[0:30:370];%单位N/m
y=[800:50:2200];%单位r/min
[X,Y]=meshgrid(x,y)
npmax=3900;%单位r/min
nmmax=3490;%单位r/min
dmmax=55;%单位cm3/r
ppmax=42;%单位Mpa
pmmax=42;%单位Mpa
iic=((1+k2)./(e./(i1.*i2)+k2.*((1+k1)./k1)));
icia=(e./((1+k2).*i1.*i2));
icib=((k2.*(1+k1))./((1+k2).*k1));
icab=(k2./(1+k2));
ici=icia+icib;
yp=0.87.*[(Y./(i1.*npmax)).^0.05+0.035.*sin(4.*Y./(i1.*npmax))].*[exp(-3.3.*X/(dmmax* ppmax))-exp(-5.*X/( dmmax * ppmax))+exp(0.05.*X/( dmmax * ppmax))].*abs(e).^0.5;
ym=0.87.*[(e.*Y./(i1.*nmmax)).^0.05+0.035*sin(4.*e.*Y/(i1.*nmmax))] .*[exp(-3.3.*X/(dmmax* pmmax))-exp(-5.*X/( dmmax * pmmax))+exp(0.05.*X/( dmmax * pmmax))];
Z=abs(yp.*ym);
y1=[(1+abs(iic).*(abs(icib-icab.*ici)*0.019+abs(icia).*(1-0.98*0.98*Z))).^(-1)]*0.95;%存在功率循环计算
surf(X,Y,y1);

% xlabel('Torque of FDM (N·m)','fontsize',fontsize_label);
% ylabel('Engine speed(rpm)','fontsize',fontsize_label);
zlabel('Transmission efficiency(-)','fontsize',fontsize_label);
x1=xlabel('Torque of FDM (N·m)');
x2=ylabel('Engine speed(rpm)');
set(x1,'Rotation',10);
set(x2,'Rotation',-22);
set(gca,'Fontname','times new Roman');
set(gca,'FontSize',fontSize_number);


