clc;clear all
x = [2 3 4 5 6];N = 8;
x = [x,zeros(1,N-length (x))];nx = 0:N-1
y = x(mod(-nx,N)+1);
subplot (121),stem([0:N-1],x);title('ԭ����')
xlabel('n');ylabel('x(n)');grid;
subplot(122),stem([0:N-1],y);title('Բ�����еķ�ת')
xlabel( 'n');ylabel('x((n))8 r8(n)');grid;
