clc;clear all;
n = 0:4;x =[2 3 4 3 2];
k = 0:1000; w =(pi/500)*k;%ȡֵΪ0-2pi��
X = x*(exp(-j*pi/500)).^(n'*k);
magX = abs(X);angX = angle(X);
subplot (2,2,1);stem(n,x,'.');
title('��2.34������ͼ')
ylabel('x(n)');axis([0,5,0,6]);
subplot (2,2,2);plot(w/pi,magX);grid
xlabel('');title('��Ƶ����');ylabel('ģֵ')
subplot(2,2,4);plot(w/pi,angX);grid
xlabel('��\piΪ��λ��Ƶ��');title('��Ƶ����');ylabel('����')