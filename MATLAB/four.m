
x=linspace(0,4*pi,100);
y=sin(x);
plot(x,y);
gtext('y = sin(x)'); % ͼ��ע��,ע��Ҫ����궨λ
hold on;
y=cos(x);
plot(x,y,'ro');
gtext ('y = cos(x)'); % ͼ��ע��
xlabel('x��');  % x��ע��
ylabel('y��');  % y��ע�� 
title('�������Һ���ͼ��'); % ͼ�α���
