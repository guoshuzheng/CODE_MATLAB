clc ;
clear all;
x = [1 2 3 4 ];
N = length(x);
K = 4;
nx = 0:N-1;%���ֿռ�
ny = 0:(K*N-1);%ny��һ��20������
y = x(mod(ny,N)+1);%�ֱ���ÿһ��yֵ
figure (1)
subplot (211),stem(nx,x,'.')
axis ([-1,N+1,0,5]);grid;
title ('��崺���');
subplot (212),stem(ny,y,'*')
axis ([-1,K*N,0,5]);grid;