function [output1,output2,output3]=pomiga(E,dE)

global init NNN

bound=sum(init)/size(init,1);
% bound1=bound(1)+1;
% bound2=bound(2)+1;
output1=zeros(size(E));

for i=1:size(E,1)
    for j=1:size(E,2)
        boundj=bound(j)+NNN;
        if abs(E(i,j))>boundj
            E(i,j) = boundj*sign(E(i,j));
        end
    end
end

output1 = E;
output2=zeros(size(output1));

for i3=1:size(output1,1)
    for j3=1:size(output1,2)
        boundj=bound(j3)+NNN;
        if abs(output1(i3,j3))==abs(boundj)
            output2(i3,j3) = 0;
        else
            output2(i3,j3) = 1;
        end
    end
end  





for i0=1:size(dE,1)
    for j0=1:size(dE,2)
        boundj0=bound(j0)+NNN;
        if abs(dE(i0,j0))>boundj0
            dE(i0,j0) = boundj0*sign(dE(i0,j0));
        end
    end
end

output3=zeros(size(dE));

for i2=1:size(dE,1)
    for j2=1:size(dE,2)
        boundj0=bound(j2)+NNN;
        if abs(dE(i2,j2))==abs(boundj0)
            output3(i2,j2) = 0;
        else
            output3(i2,j2) = 1;
        end
    end
end  
end
