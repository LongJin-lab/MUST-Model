function output=pomiga(E)



output=zeros(size(E));

for i=1:length(E)
    if E(i)>1
       E(i) = 1;
    end
    if E(i)<0
        E(i) = 0;
    end
end
for i=1:length(E)
   
     
        output(i) =E(i);
   
end

% for i=1:length(E)
%     if E(i)>0
%         Ei_gds = abs(E(i));
%         output(i) =Ei_gds.^r_gds+10*E(i);
%     end
%     if E(i)<0
%         Ei_gds = abs(E(i));
%         output(i) = -Ei_gds.^r_gds+10*E(i);
%     end
% end
