e=1;
ne=[800:10:2200];
te=[0:10:400];
[X,Y]=meshgrid(ne,te)
x=0.87.*((X/(0.62*3900)).^(0.05)+0.035*sin(4*X/(0.62*3900))).*(exp(-3.3.*Y/(55*42))-exp(-5.*Y/(55*42))+exp(0.05.*Y/(55*42)))*(abs(e)^0.5);
y=0.87.*((e*X/(0.62*3490)).^(0.05)+0.035*sin(4*e*X/(0.62*3490))).*(exp(-3.3.*Y/(55*42))-exp(-5.*Y/(55*42))+exp(0.05.*Y/(55*42)));
Z=x.*y;
mesh(X,Y,real(Z));