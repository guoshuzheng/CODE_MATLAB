
x=linspace(0,4*pi,100);
y=sin(x);
plot(x,y);
gtext('y = sin(x)'); % 图形注解,注意要用鼠标定位
hold on;
y=cos(x);
plot(x,y,'ro');
gtext ('y = cos(x)'); % 图形注解
xlabel('x轴');  % x轴注解
ylabel('y轴');  % y轴注解 
title('正弦余弦函数图象'); % 图形标题
