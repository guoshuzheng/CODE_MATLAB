x=0:0.3:2*pi;y=sin(x);z=cos(x);w=0.5*z;
plot(x,y,'ro-',x,z,'b*--',x,w,'ks-')
title('\fontsize{30}\fontname{����}���Ǻ���ͼ��')
xlabel('0\leq\itt\rm\leq\rm2\pi','fontsize',16)
%���·���tȡֵ��Χ
ylabel('���Ǻ���','fontsize',16)
%y������  ���Ǻ���
legend('sin(x)','cos(x)','0.5cos(x)')
%���Ͻǵĺ�����ʾ��־
