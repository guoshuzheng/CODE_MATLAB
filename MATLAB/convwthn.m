function [y,ny] = convwthn (x,nx,h,nh);
ny1 = nx(1)+nh(1);
ny2 = nx(2)+nh(2);
y = conv(x,h);
ny = ny1:ny2;