function A = WS(position)
 str = ["#000000",'#FF0000','#DEB887','#FDF5E6','#008000','#8B4513','#0000FF','#800080','#FFC0CB','#8B0000'];
N=50;
K=4;
for i=1:N
    x(i)=position(3*i - 2);
    y(i)=position(3*i - 1);
    z(i)=position(3*i);
end
% if K>floor(N-1)|mod(K,2)~=0;
% disp('参数输入错误：K值必须是小于网络节点总数且为偶数的整数');
% return ;
% end
 
% angle=0:2*pi./N:2*pi-2*pi/N;
% angle=0:2*pi/N:2*pi-2*pi/N;
% x=100*sin(angle);
% y=100*cos(angle);
figure(1)
% plot3(x(1),y(1),z(1),'ro','MarkerEdgeColor','g','MarkerFaceColor','#000000','MarkerSize',8);hold on;
% plot3(x(2),y(2),z(2),'ro','MarkerEdgeColor','g','MarkerFaceColor','#FF0000','MarkerSize',8);hold on;
% plot3(x(3),y(3),z(3),'ro','MarkerEdgeColor','g','MarkerFaceColor','#DEB887','MarkerSize',8);hold on;
% plot3(x(4),y(4),z(4),'ro','MarkerEdgeColor','g','MarkerFaceColor','#FDF5E6','MarkerSize',8);hold on;
% plot3(x(5),y(5),z(5),'ro','MarkerEdgeColor','g','MarkerFaceColor','#008000','MarkerSize',8);hold on;
% plot3(x(6),y(6),z(6),'ro','MarkerEdgeColor','g','MarkerFaceColor','#8B4513','MarkerSize',8);hold on;
% plot3(x(7),y(7),z(7),'ro','MarkerEdgeColor','g','MarkerFaceColor','#0000FF','MarkerSize',8);hold on;
% plot3(x(8),y(8),z(8),'ro','MarkerEdgeColor','g','MarkerFaceColor','#800080','MarkerSize',8);hold on;
% plot3(x(9),y(9),z(9),'ro','MarkerEdgeColor','g','MarkerFaceColor','#FFC0CB','MarkerSize',8);hold on;
% plot3(x(10),y(10),z(10),'ro','MarkerEdgeColor','g','MarkerFaceColor','#8B0000','MarkerSize',8);hold on;
% 
% plot3(x(11),y(11),z(11),'ro','MarkerEdgeColor','g','MarkerFaceColor','#000000','MarkerSize',8);hold on;
% plot3(x(12),y(12),z(12),'ro','MarkerEdgeColor','g','MarkerFaceColor','#FF0000','MarkerSize',8);hold on;
% plot3(x(13),y(13),z(13),'ro','MarkerEdgeColor','g','MarkerFaceColor','#DEB887','MarkerSize',8);hold on;
% plot3(x(14),y(14),z(14),'ro','MarkerEdgeColor','g','MarkerFaceColor','#FDF5E6','MarkerSize',8);hold on;
% plot3(x(15),y(15),z(15),'ro','MarkerEdgeColor','g','MarkerFaceColor','#008000','MarkerSize',8);hold on;
% plot3(x(16),y(16),z(16),'ro','MarkerEdgeColor','g','MarkerFaceColor','#8B4513','MarkerSize',8);hold on;
% plot3(x(17),y(17),z(17),'ro','MarkerEdgeColor','g','MarkerFaceColor','#0000FF','MarkerSize',8);hold on;
% plot3(x(18),y(18),z(18),'ro','MarkerEdgeColor','g','MarkerFaceColor','#800080','MarkerSize',8);hold on;
% plot3(x(19),y(19),z(19),'ro','MarkerEdgeColor','g','MarkerFaceColor','#FFC0CB','MarkerSize',8);hold on;
% plot3(x(20),y(20),z(20),'ro','MarkerEdgeColor','g','MarkerFaceColor','#8B0000','MarkerSize',8);hold on;
for i= 1:50
    plot3(x(i),y(i),z(i),'ro','MarkerEdgeColor','g','MarkerFaceColor',str(randi(10)),'MarkerSize',5);hold on;
end
 
hold on;
A=zeros(N);
for i=1:N
for j=i+1:i+K/2
jj=j;
if j>N
jj=mod(j,N);
end
A(i,jj)=1;
A(jj,i)=1;
end
end
 
% WS小世界网络的代码
p=0.2;
for i=1:N
    for j=i+1:i+K/2
        jj=j;
        if j>N
            jj=mod(j,N);
        end
        p1=rand(1,1);
        if p1<p
            A(i,jj)=0;A(jj,i)=0;A(i,i)=inf;a=find(A(i,:)==0);
            rand_data=randi([1,length(a)],1,1);
            jjj=a(rand_data);A(i,jjj)=1;A(jjj,i)=1;A(i,i)=0;
        end
    end
end
 
for i=1:N
for j=i+1:N
if A(i,j)~=0
% plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2);
plot3([x(i),x(j)],[y(i),y(j)],[z(i),z(j)],'color','#8FBC8F','linewidth',1.2);
hold on;
end
end
end
grid on;
axis([0,30,0,30,0,30]) 
hold off