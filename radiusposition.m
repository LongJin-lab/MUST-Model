function final=radiusposition(position,r)
n=5;%总点数
% r=5;%半径


x=100*rand(1,10000)-50;   %一行10000列的数组
y=100*rand(1,10000)-50;
rx=x((x-position(1)).^2+(y-position(2)).^2<r^2);
ry=y((x-position(1)).^2+(y-position(2)).^2<r^2);






% x=2*r*rand(1,n)-r;%开始构造随机点
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

num=floor(1+(length(rx)-1)*rand(1));  %向下取整
final=[rx(num);ry(num)];

end
% plot(x,y,'ro')
% axis equal