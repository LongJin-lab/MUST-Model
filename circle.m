clc;
clear;
t=0:-0.01:-4*pi;
y=sin(t);
x=cos(t);
comet(x(1:10),y(1:10),0.2);
% plot(x,y);
% axis equal;  %axis square ��ǰ����ϵͼ������Ϊ���Σ��̶ȷ�Χ��һ��һ����axis equal ��������ĵ�λ������ͬ����Ҳ��һ���Ƿ��ε�
% % h=line(x(1),y(1),'color','r','linestyle','-.','xdata',0,'ydata',1,'markersize',50,'erasemode','xor');
% hold on;
% i=1;
% n=length(t);
% h=plot(x,y,'or');
% while 1
% set(h,'xdata',x(i),'ydata',y(i));  %���ϵĽ�x��y�ĸ����������Ϣ����xdata��ydata  ����������������ͨ����drawnow��ϻ���ͼ��
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
axis equal;  %axis square ��ǰ����ϵͼ������Ϊ���Σ��̶ȷ�Χ��һ��һ����axis equal ��������ĵ�λ������ͬ����Ҳ��һ���Ƿ��ε�
% h=line(x(1),y(1),'color','r','linestyle','-.','xdata',0,'ydata',1,'markersize',50,'erasemode','xor');
hold on;
i=1;
n=length(t);
h=plot(x(1),y(1),'or');
while 1
set(h,'xdata',x(i),'ydata',y(i));  %���ϵĽ�x��y�ĸ����������Ϣ����xdata��ydata  ����������������ͨ����drawnow��ϻ���ͼ��
drawnow
pause(0.01)
i=i+1;
if i>n
i=1;
end
end

% t=0:pi/50:10*pi;
% plot3(sin(t),cos(t),t),axis square%�����켣��ͼ��
% comet3(sin(t),cos(t),t ,0.2 );