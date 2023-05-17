function doty=distance(y)

global  n ;



for i=1:n
    jl(i)=100-norm([y(2*i-1)-y(2*n+1);y(2*i)-y(2*n+2)]) ;
end



doty=jl';