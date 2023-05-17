clc;
clear;
t=0:-0.01:-4*pi;
y=sin(t);
x=cos(t);
comet(x(1:10),y(1:10),0.2);
% plot(x,y);
% axis equal;  %axis square 当前坐标系图形设置为方形，刻度范围不一定一样；axis equal 横轴纵轴的单位长度相同，但也不一定是方形的
% % h=line(x(1),y(1),'color','r','linestyle','-.','xdata',0,'ydata',1,'markersize',50,'erasemode','xor');
% hold on;
% i=1;
% n=length(t);
% h=plot(x,y,'or');
% while 1
% set(h,'xdata',x(i),'ydata',y(i));  %不断的将x与y的各点的数据信息赋给xdata和ydata  （这两个数据属性通常和drawnow结合画动图）
% drawnow
% pause(0.01)
% i=i+1;
% if i>n
% i=1;
% end
% end
% 
% 
clc;
clear;
t=0:0.01:4*pi;
y=sin(t);
x=cos(t);
plot(x,y);
axis equal;  %axis square 当前坐标系图形设置为方形，刻度范围不一定一样；axis equal 横轴纵轴的单位长度相同，但也不一定是方形的
% h=line(x(1),y(1),'color','r','linestyle','-.','xdata',0,'ydata',1,'markersize',50,'erasemode','xor');
hold on;
i=1;
n=length(t);
h=plot(x(1),y(1),'or');
while 1
set(h,'xdata',x(i),'ydata',y(i));  %不断的将x与y的各点的数据信息赋给xdata和ydata  （这两个数据属性通常和drawnow结合画动图）
drawnow
pause(0.01)
i=i+1;
if i>n
i=1;
end
end

% t=0:pi/50:10*pi;
% plot3(sin(t),cos(t),t),axis square%画出轨迹的图像
% comet3(sin(t),cos(t),t ,0.2 );