function doty=distance(y)

global  n ;



for i=1:n
    jl(i)=100-norm([y(3*i-2)-y(3*n+1);y(3*i-1)-y(3*n+2);y(3*i)-y(3*n+3)]) ;
end



doty=jl';