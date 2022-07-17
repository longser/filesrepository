v=[0:1:40];
ne=[800:50:2200];
[V,NE]=meshgrid(v,ne);
ig=0.377.*NE.*0.75./(6.4*3.7.*V);
ig(ig>=4.33)=4.33;
ig(ig<=0.63)=0.63;
mesh(V,NE,ig);
xlabel('Speed (km/h)','FontWeight','bold');
ylabel('Engine speed (r/min)','FontWeight','bold');
zlabel('Transmission ratio','FontWeight','bold');


