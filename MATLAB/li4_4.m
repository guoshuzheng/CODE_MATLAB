clc;clear all
x = [2 1 -1  2 3];nx = 0:4;k = 128;dw = 2*pi/k;
k = floor((-k/2+0.5):(k/2-0.5));
X = x*exp(-j*dw*nx'*k);
subplot(221);plot(k*dw,abs(X));hold on;
xlabel('\omega');ylabel('������Ӧ');title('5�����е�dtft��fft');grid;
Xd = fft([2 1 -1 2 3]);plot([0:4]*2*pi/5,abs(Xd),'.');
Xd1 = fftshift(Xd);
subplot(222);plot(k*dw,abs(X));hold on;
xlabel ('\omega');ylabel('������Ӧ');title('fft�Ժ�');
plot ([-2:2]*2*pi/5,abs(Xd1),'.');grid;
subplot(223);plot(k*dw,angle(X));hold on;
xlabel('\omega');ylabel('��λ��Ӧ');title('fft��λ��');grid; 
