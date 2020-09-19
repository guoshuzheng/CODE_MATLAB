[x,y]=meshgrid(-8:0.5:8);
z=sin(sqrt(x.^2+y.^2)./sqrt(x.^2+y.^2))
subplot(1,3,1)
mesh(x,y,z)
subplot(1,3,2)
surf(x,y,z)
subplot(1,3,3)
surf(x,y,z)
shading interp