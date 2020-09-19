 x=-pi/6:0.3:2*pi;
 y=(3+sin(x)).*exp(-0.2*x);
 z=(2+cos(x)).*exp(-0.4*x);
plot(x,y,'ro-','LineWidth',2)
hold on 
plot(x,z,'yo-','LineWidth',3)
grid off
%注意，x y+颜色线形状+宽度
 %     x y+线形状，宽度，颜色

  