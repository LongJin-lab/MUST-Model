m_original=3;
m_add=2;
m_after_growth=10;
pp=1;
N = 10;
angle=0:2*pi./N:2*pi-2*pi/N;
angle=0:2*pi/N:2*pi-2*pi/N;
x=100*sin(angle);
y=100*cos(angle);
 
A=zeros(m_original);
switch pp
    case 1
        A=zeros(m_original);
    case 2
        A=ones(m_original);
    case 3
        for i=1:m_original
            for j=i+1:m_original
                p=rand(1,1);
                if p>0.5
                    A(i,j)=1;
                    A(j,i)=1;
                end
            end
        end
end
 
for k=m_original+1:m_after_growth
    M=k-1;    
    p=zeros(1,M);
    
%     x_now=100*rand(1,1);
%     y_now=100*rand(1,1);
%     x(k)=x_now;
%     y(k)=y_now;
    angle=0:2*pi./N:2*pi-2*pi/N;
    angle=0:2*pi/N:2*pi-2*pi/N;
    x=100*sin(angle);
    y=100*cos(angle);
 
    for i=1:M
        p(i)=(length(find(A(i,:)==1))+1)/(length(find(A==1))+M);
    end
    p
    pp=cumsum(p);
    pp
    visit=zeros(1,M);
    for i=1:m_add
        random_data=rand(1,1);
        random_data
        aa=find(pp>=random_data); jj=aa(1);
        
        A(k,jj)=1;
        A(jj,k)=1;
        visit(jj)=1;
        visit
        degree=zeros(1,M);
        total_degree=0;
        for ii=1:M
            if visit(ii)==1
                p(ii)=0;
                degree(ii)=0;
            else
                degree(ii)=length(A(i,:)==1)+1;
            end
            total_degree=total_degree+degree(ii);
        end
        for iii=1:M
            p(iii)=degree(iii)/total_degree;
        end
        p
        pp=cumsum(p);
        pp
    end
end
 
A
plot(x,y,'ro','MarkerEdgeColor','g','MarkerFaceColor','r','MarkerSize',8);
hold on;
for i=1:m_after_growth
    for j=i+1:m_after_growth
        if A(i,j)~=0
            plot([x(i),x(j)],[y(i),y(j)],'color','#000000','linewidth',2);
        end
    end
end
 
hold off;
    
       
                