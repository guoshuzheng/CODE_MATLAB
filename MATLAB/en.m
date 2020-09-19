clc; clear all;
x = [1 2 3 4 5]
y = [2 3 4 5 6]
z =conv(x,y);
N = length(x)+length(y)-1;
figure(1),subplot(311),stem(x,'.');axis([0 6 0 7]);
subplot(312),stem(y,'.');axis([0 6 0 7])
subplot(313),stem(z,'.');axis([0 N 0 80])
L = N+1;
x1 = [x,zeros(l,L - length(x))];
y1 = [x,zeros(1,L - length(y))];

