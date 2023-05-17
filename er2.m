N=20
p=0.4
 
degree=zeros(N,1);
position=zeros(N,2);
 
for m=1:N
    position(m,1)=cos(m/N*2*pi);
    position(m,2)=sin(m/N*2*pi);
end
 
figure('name','ER随机图');
hold on;
% plot(position(:,1),position(:,2),'d')
plot(position(:,1),position(:,2),'ro','MarkerEdgeColor','g','MarkerFaceColor','r','MarkerSize',8);
for m=1:N
    for n=m+1:N
        if(rand(1,1)<p)
            degree(m,1)=degree(m,1)+1;
            degree(n,1)=degree(n,1)+1;
            plot(position([m,n],1),position([m,n],2),'color','#000000','linewidth',2)
        end
    end
end
hold off;
 
figure('name','度分布直方图');
hist(degree);