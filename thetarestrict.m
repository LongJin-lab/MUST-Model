function finaltheta=thetarestrict(standard,theta1,theta2,theta3)

for num=1:length(standard)
    abs1=abs(standard(num)-theta1);
    abs2=abs(standard(num)-theta2);
    abs3=abs(standard(num)-theta3);
    minimize=min([abs1,abs2,abs3]);
    if minimize==abs1
        finaltheta(num)=theta1;
    else
        if minimize==abs2
            finaltheta(num)=theta2;
        else
            finaltheta(num)=theta3;
        end
    end
end
finaltheta;
    