function final=radiusposition(position,r)
n=5;%�ܵ���
% r=5;%�뾶


x=100*rand(1,10000)-50;   %һ��10000�е�����
y=100*rand(1,10000)-50;
rx=x((x-position(1)).^2+(y-position(2)).^2<r^2);
ry=y((x-position(1)).^2+(y-position(2)).^2<r^2);






% x=2*r*rand(1,n)-r;%��ʼ���������
% y=2*r*rand(1,n)-r; 
% 
% index=find((x-position(1)).^2+(y-position(2)).^2>r.^2);
% len=length(index);
% x(index)=[];
% y(index)=[];
% while len
%  xt=2*r*rand(1,len)-r;
%  yt=2*r*rand(1,len)-r;
%  index=find((xt-position(1)).^2+(yt-position(2)).^2>r.^2);
%  len=length(index);
%  xt(index)=[];
%  yt(index)=[];
%  x=[x xt];
%  y=[y yt];
% end

num=floor(1+(length(rx)-1)*rand(1));  %����ȡ��
final=[rx(num);ry(num)];

end
% plot(x,y,'ro')
% axis equal