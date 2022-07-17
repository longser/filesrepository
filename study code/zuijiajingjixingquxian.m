x=0:0.1:1;
y=(-210.*x.^4-150.*x.^3+810.*x.^2+1000.*x+750);
plot(x,y);
xlabel('Load rate','FontWeight','bold');
ylabel('Engine speed (r/min)','FontWeight','bold');
box off 
