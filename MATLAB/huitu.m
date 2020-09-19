x=0:0.3:2*pi;y=sin(x);z=cos(x);w=0.5*z;
plot(x,y,'ro-',x,z,'b*--',x,w,'ks-')
title('\fontsize{30}\fontname{隶书}三角函数图像')
xlabel('0\leq\itt\rm\leq\rm2\pi','fontsize',16)
%最下方的t取值范围
ylabel('三角函数','fontsize',16)
%y轴左侧的  三角函数
legend('sin(x)','cos(x)','0.5cos(x)')
%右上角的函数表示标志
