clc;clear all
N = 5;M = 2*N+1; n = -20:20;
x = [zeros(1,15),ones(1,M),zeros(1,15)];
omega = [-pi:0.01*pi:pi*pi];
X = sin (0.5*M*omega)./sin(0.5*omega)
subplot(2,1,1);stem(n,x,'.');
title('ÐòÁÐ');xlabel('n');
ylabel('x(n)');axis([-20,20,-0.2,1.5]);grid;
subplot(212);plot(omega/pi,X);xlabel('\omega\pi');title('ÆµÆ×');
ylabel('X(e^j\omega)');axis([-1,1,min(X),max(x)+10]);grid;