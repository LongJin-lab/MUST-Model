function A = ER(position)
 str = ["#000000",'#FF0000','#DEB887','#FDF5E6','#008000','#8B4513','#0000FF','#800080','#FFC0CB','#8B0000'];
N=50
p=0.2
A=zeros(N);
for i=1:N
    x(i)=position(3*i - 2);
    y(i)=position(3*i - 1);
    z(i)=position(3*i);
end
 

figure(3)
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
for i= 1:50
    plot3(x(i),y(i),z(i),'ro','MarkerEdgeColor','g','MarkerFaceColor',str(randi(10)),'MarkerSize',5);hold on;
end
 hold on;
for i=1:N
    for j=i+1:N
        if(rand(1,1)<p)
%             degree(m,1)=degree(m,1)+1;
%             degree(n,1)=degree(n,1)+1;
%             plot3(position([m,n],1),position([m,n],2))
            plot3([x(i),x(j)],[y(i),y(j)],[z(i),z(j)],'color','#8FBC8F','linewidth',1.2);
            A(i,j)=1;
            A(j,i)=1;
        end
    end
end
grid on;
axis([0,30,0,30,0,30]) 
hold off;

% figure('name','度分布直方图');
% hist(degree);