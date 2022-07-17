iHM=0.2:0.01:1;
k=1.5;
Eh1=(1+k).*iHM./(0.81*(1+k)*iHM-0.81+1);
Eh2=(0.81*(1+k)*iHM)./((1+k).*iHM+0.81-1);
plot(iHM,Eh1);
hold on;
plot(iHM,Eh2);