clc;
x = [1 2 3 -1 2];nx = -1:3;
h = [2 2 1 -1 4 -2];nh = -3:2;
[y,ny] = convwthn(x,nx,h,nh);
stem (ny,y,'.')
xlabel('n');
ylabel('y(n)');
grid;