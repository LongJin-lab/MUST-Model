N=30;
K=4;
angle=0:2*pi./N:2*pi-2*pi/N;
angle=0:2*pi/N:2*pi-2*pi/N;
x=100*sin(angle);
y=100*cos(angle);
plot(x,y,'ro','MarkerEdgeColor','g','MarkerFaceColor','r','MarkerSize',8);
 
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
 
%WS小世界网络的代码
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
plot([x(i),x(j)],[y(i),y(j)],'color','#000000','linewidth',2);
hold on;
end
end
end
axis equal;
hold off