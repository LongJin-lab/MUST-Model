%for PA10
clear all;
close all;
clc
format long;
global a  gamma lambda n k cfd tstart c0 c1 obs threshold;



cfd=1;
n=50;
k=3;

h=500;
c0=5;
c1=5;
a=0.5;
gamma=1;
lambda=200;
% vmark=10*rand(n,1);
tstart=0;
T=10;
tau=0.001;

Kp=0.005;
Ti=0.000015;
Td=0.05;
KP=Kp*(1+tau/Ti+Td/tau);
KI=Kp*(1+2*Td/tau);
KD=Kp*(Td/tau);

tspan=tstart:tau:T;
radius = 3;
position=randsample(300,150,1);
position= floor(position/10);
position = [12;12;26;14;18;21;29;17;20;18;28;26;6;6;8;23;6;30;22;6;26;28;29;18;17;6;16;17;5;15;17;6;19;1;10;16;10;19;11;5;28;20;20;21;23;26;16;5;12;25;6;10;29;25;7;30;2;13;13;13;4;13;19;30;7;11;8;9;6;1;14;8;27;16;28;30;18;4;28;18;27;13;19;3;28;20;4;22;12;3;7;8;7;22;23;17;17;19;30;20;19;28;18;11;29;14;19;22;21;7;3;9;27;17;14;13;24;20;20;5;13;16;12;15;11;24;12;22;15;22;29;16;28;7;27;3;14;1;25;6;5;6;21;7;9;24;16;28;2;14];
jla = WS(position);
y(:,:,1)=[position;10*rand(4,1);0.1*ones(n,1);zeros(n,1)];  %Î»ÖÃ
 
tout=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D=10;


L=diag(jla*ones(n,1))-jla;
  

y(3*n+1:3*n+3,:,1) = [30,30,30];
for j=1:D
    TT=tspan(j);
 
    carx(:,:,j)=y(1:3*n,:,j);
    ballx(:,:,j)=y(3*n+1:3*n+3,:,j);
    z(:,:,j)=y(3*n+4,:,j);
    eta(:,:,j)=y(3*n+5:4*n+4,:,j);
    etb(:,:,j)=y(4*n+5:5*n+4,:,j);
    

    dcar(:,:,j)=exp(1*(tstart-TT))*10*(ballx(:,:,j))/norm(ballx(:,:,j));
    ballx(:,:,j+1)=ballx(:,:,j)+0.001*dcar(:,:,j);
    
    dis(:,:,j)=distance1(y(1:3*n+3,:,j));
    
    for cnt1=1:n
        vjl(3*cnt1-2,:,j)=dis(cnt1,:,j);
        vjl(3*cnt1-1,:,j)=dis(cnt1,:,j);
        vjl(3*cnt1,:,j)=dis(cnt1,:,j);
        xb(3*cnt1-2,:,j)=ballx(1,:,j);
        xb(3*cnt1-1,:,j)=ballx(2,:,j);
        xb(3*cnt1,:,j)=ballx(3,:,j);
    end
  
   [etaa(:,:,j),Mdox1,Mdox2]=pomiga1(eta(:,:,j),eta(:,:,j));

   eta(:,:,j+1)=(tau*(-L*eta(:,:,j)-h*sat(eta(:,:,j)-pomiga(z(:,:,j)*ones(n,1)+dis(:,:,j)/(2*a)))-h*L'*etb(:,:,j).*Mdox2-gamma*L*etaa(:,:,j).*Mdox2))+eta(:,:,j);
   etb(:,:,j+1)=etb(:,:,j)+tau*L*eta(:,:,j);  
 
   dotx(:,:,j)=-cfd*pomiga(z(:,:,j)*ones(3*n,1)+vjl(:,:,j)/(2*a)).*(carx(:,:,j)-xb(:,:,j))-cfd*(1-pomiga(z(:,:,j)*ones(3*n,1)+vjl(:,:,j)/(2*a))).*(carx(:,:,j)-position);
   carx(:,:,j+1)=carx(:,:,j)+tau*dotx(:,:,j);
 
   dotz(:,:,j)=-lambda*(ones(1,n)*eta(:,:,j)-k);
   z(:,:,j+1)=z(:,:,j)+tau*dotz(:,:,j);
    
   y(:,:,j+1)=[carx(:,:,j+1);ballx(:,:,j+1);z(:,:,j+1);eta(:,:,j+1);etb(:,:,j+1)];

end



for j=D+1:length(tspan)-1
    TT=tspan(j);
    if j == 3000
        jla = BA(position);
        L2=diag(jla*ones(n,1))-jla;
    end
    if j == 6000
        jla = ER(position);
        L3=diag(jla*ones(n,1))-jla;
    end
    carx(:,:,j)=y(1:3*n,:,j);
    ballx(:,:,j)=y(3*n+1:3*n+3,:,j);
    z(:,:,j)=y(3*n+4,:,j);
    eta(:,:,j)=y(3*n+5:4*n+4,:,j);
    etb(:,:,j)=y(4*n+5:5*n+4,:,j);
    

    dcar(:,:,j)=exp(1*(tstart-TT))*10*(ballx(:,:,j))/norm(ballx(:,:,j));
    ballx(:,:,j+1)=ballx(:,:,j)+0.001*dcar(:,:,j);
    
    dis(:,:,j)=distance1(y(1:3*n+3,:,j));
    

    for cnt1=1:n
        vjl(3*cnt1-2,:,j)=dis(cnt1,:,j);
        vjl(3*cnt1-1,:,j)=dis(cnt1,:,j);
        vjl(3*cnt1,:,j)=dis(cnt1,:,j);
        xb(3*cnt1-2,:,j)=ballx(1,:,j);
        xb(3*cnt1-1,:,j)=ballx(2,:,j);
        xb(3*cnt1,:,j)=ballx(3,:,j);

    end
   [etaa(:,:,j),Mdox1,Mdox2]=pomiga1(eta(:,:,j),eta(:,:,j));

   eta(:,:,j+1)=(tau*(-L*eta(:,:,j)-h*sat(eta(:,:,j)-pomiga(z(:,:,j)*ones(n,1)+dis(:,:,j)/(2*a)))-h*L'*etb(:,:,j).*Mdox2-gamma*L*etaa(:,:,j).*Mdox2))+eta(:,:,j);
   etb(:,:,j+1)=etb(:,:,j)+tau*L*eta(:,:,j);  
   if j >= 3001 && j < 6000 
       eta(:,:,j+1)=(tau*(-L2*eta(:,:,j)-h*sat(eta(:,:,j)-pomiga(z(:,:,j)*ones(n,1)+dis(:,:,j)/(2*a)))-h*L2'*etb(:,:,j).*Mdox2-gamma*L*etaa(:,:,j).*Mdox2)-L2*(etaa(:,:,3000+1)-etaa(:,:,3000)))+eta(:,:,j);
       etb(:,:,j+1)=etb(:,:,j)+tau*L2*eta(:,:,j);
   end
   if j >= 6001 
       eta(:,:,j+1)=(tau*(-L3*eta(:,:,j)-h*sat(eta(:,:,j)-pomiga(z(:,:,j)*ones(n,1)+dis(:,:,j)/(2*a)))-h*L3'*etb(:,:,j).*Mdox2-gamma*L*etaa(:,:,j).*Mdox2-L2*(etaa(:,:,3000+1)-etaa(:,:,3000))-L3*(etaa(:,:,6000+1)-etaa(:,:,6000))))+eta(:,:,j);
       etb(:,:,j+1)=etb(:,:,j)+tau*L3*eta(:,:,j);
   end
   
   
   dotx(:,:,j)=-cfd*pomiga(z(:,:,j)*ones(3*n,1)+vjl(:,:,j)/(2*a)).*(carx(:,:,j)-xb(:,:,j))-cfd*(1-pomiga(z(:,:,j)*ones(3*n,1)+vjl(:,:,j)/(2*a))).*(carx(:,:,j)-position);
   carx(:,:,j+1)=carx(:,:,j)+             tau*dotx(:,:,j);
   dotz(:,:,j)=-lambda*(ones(1,n)*eta(:,:,j)-k);
   z(:,:,j+1)=z(:,:,j)+tau*dotz(:,:,j);

   y(:,:,j+1)=[carx(:,:,j+1);ballx(:,:,j+1);z(:,:,j+1);eta(:,:,j+1);etb(:,:,j+1)];
   
end
 


for cnt3=1:length(tspan)
    z=y(3*n+4,:,cnt3);
    
    xp(:,:)=pomiga(z*ones(n,1)+distance1(y(1:3*n+3,:,cnt3))/(2*a));
    for i= 1:50
        xp1(cnt3,i)=xp(i,:);
    end
end
 str = ["#000000",'#FF0000','#DEB887','#FDF5E6','#008000','#8B4513','#0000FF','#800080','#FFC0CB','#8B0000'];
 str1 = ['-','--',':','-.'];
figure(4)
for i= 1:50
    if i == 8
        continue;
    end
    plot(tspan,xp1(:,i),'color',str(randi(10)),'linestyle',str1(randi(4)),'linewidth',1.6),hold on;
end
plot(tspan,xp1(:,8),'color','#0000FF','linestyle','--','linewidth',1.6),hold on;
ylim([-0.2,1.2]);
title('winner')


for cnt4=1:length(tspan)
    for cntlengthy=1:3*n+3
    newy(cntlengthy,cnt4)=y(cntlengthy,:,cnt4);
    end
end
figure(5)
for i= 1:50
    plot3(newy(3*i-2,1),newy(3*i-1,1),newy(3*i,1),'ro','MarkerEdgeColor','g','MarkerFaceColor',str(randi(10)),'MarkerSize',5);hold on;
end
for cnti=1:n
     plot3(newy(3*cnti-2,:),newy(3*cnti-1,:),newy(3*cnti,:));hold on;
end
plot3(newy(3*n+1,1),newy(3*n+2,1),newy(3*n+3,1),'rx','MarkerSize',11);hold on;
plot3(newy(3*n+1,:),newy(3*n+2,:),newy(3*n+3,:));hold on;
plot3(newy(3*n+1,10000),newy(3*n+2,10000),newy(3*n+3,10000),'rx','MarkerSize',11);hold on;
grid on;
axis([0,40,0,40,0,40])


for cntdotxi=1:length(tspan)-1
    for cntlengthv=1:3*n
        velo(cntlengthv,cntdotxi)=dotx(cntlengthv,:,cntdotxi);
    end
end

figure(6)
subplot(3,1,1); 
plot(tspan(1:length(tspan)-1),velo(3*8-2,:),'color','#0000FF','linestyle','-','linewidth',1.2);hold on;
for i= 1:50
    plot(tspan(1:length(tspan)-1),velo(3*i-2,:),'color',str(randi(10)),'linestyle',str1(randi(4)),'linewidth',1.2);hold on;
end
plot(tspan(1:length(tspan)-1),velo(3*4-2,:),'color','#DAA569','linestyle','-','linewidth',1.2);hold on;
plot(tspan(1:length(tspan)-1),velo(3*27-2,:),'color','#DA70D6','linestyle','-','linewidth',1.2);hold on;

subplot(3,1,2); 
for i= 1:50
    plot(tspan(1:length(tspan)-1),velo(3*i-1,:),'color',str(randi(10)),'linestyle',str1(randi(4)),'linewidth',1.2);hold on;
end
plot(tspan(1:length(tspan)-1),velo(3*8-1,:),'color','#0000FF','linestyle','-','linewidth',1.2);hold on;
plot(tspan(1:length(tspan)-1),velo(3*4-1,:),'color','#DAA569','linestyle','-','linewidth',1.2);hold on;
plot(tspan(1:length(tspan)-1),velo(3*27-1,:),'color','#DA70D6','linestyle','-','linewidth',1.2);hold on;

subplot(3,1,3); 
for i= 1:50
    plot(tspan(1:length(tspan)-1),velo(3*i,:),'color',str(randi(10)),'linestyle',str1(randi(4)),'linewidth',1.2);hold on;
end
plot(tspan(1:length(tspan)-1),velo(3*8,:),'color','#0000FF','linestyle','-','linewidth',1.2);hold on;
plot(tspan(1:length(tspan)-1),velo(3*4,:),'color','#DAA569','linestyle','-','linewidth',1.2);hold on;
plot(tspan(1:length(tspan)-1),velo(3*27,:),'color','#DA70D6','linestyle','-','linewidth',1.2);hold on;

for cnt4=1:length(tspan)-1
    xq(:,cnt4)=dis(:,:,cnt4);
end   

for i= 1:50
    xq1(:,i)=[dis(i,1,1),xq(i,:)];
end 
figure(7);

for i= 1:50
    if i == 8
        continue;
    end
    plot(tspan,xq1(:,i),'color',str(randi(10)),'linestyle',str1(randi(4)),'linewidth',1.6),hold on;
end
plot(tspan,xq1(:,8),'color','#0000FF','linestyle','-','linewidth',1.6),hold on;
ylim([0,100]);
set(gca,'yscale','log');
axis([0,10,0,100])

figure(8)

for i= 1:50
    plot3(newy(3*i-2,1),newy(3*i-1,1),newy(3*i,1),'ro','MarkerEdgeColor','g','MarkerFaceColor',str(randi(10)),'MarkerSize',5);hold on;
end
plot3(newy(3*n+1,1),newy(3*n+2,1),newy(3*n+3,1),'rx','MarkerSize',11);hold on;
grid on;
axis([0,40,0,40,0,40])

figure(9)
for i= 1:50
    plot3(newy(3*i-2,10000),newy(3*i-1,10000),newy(3*i,10000),'ro','MarkerEdgeColor','g','MarkerFaceColor',str(randi(10)),'MarkerSize',5);hold on;
end
plot3(newy(3*n+1,10000),newy(3*n+2,10000),newy(3*n+3,10000),'rx','MarkerSize',11);hold on;
grid on;
axis([0,40,0,40,0,40])

