clc;clear all;
x = [1 2 3 4 5]
y = [3 4 5 6 7]
N = length(x)+length(y)-1;
z = conv(x,y);
figure(1),subplot(311),stem(x,'.');axis([0 6 0 7]);
subplot(312),stem(y,'.');axis([0 6 0 7])
subplot(313),stem(z,'.');axis([0 N 0 80])
x0 = [x,zeros(1,N-length(x))];
y0 = [y,zeros(1,N-length(y))];
x1 = fft(x0);
y1 = fft(y0);
z1 = x1.*y1;
Zn = ifft(z1);
figure(2),stem(Zn,'.');


