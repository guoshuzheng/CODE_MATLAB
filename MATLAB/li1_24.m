clc;
x =[2,1,3,2,1,5,1];
y = [2 1 3  4];
N1 = length(x)-1;
N2 = length(y)-1;
rxy = conv(fliplr(y),x);k=(-N2):N1;
stem(k,rxy,'.');
xlabel('n');ylabel('rxy(n)');
axis([-N2,N1,0,35]);grid;