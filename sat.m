function output=sat(E)

r_gds=0.2;%need to adjust

output=zeros(size(E));

for i=1:length(E)
    if E(i)>3
       E(i) = 3;
    end
    if E(i)<-3
        E(i) = -3;
    end
end
for i=1:length(E)
   
     
        output(i) =E(i);
   
end
