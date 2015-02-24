function [ r, phi, u] = getU( a, r_, n, count)
for j = 1:count+1
    s=0;
    for i = 1:10
        phi(j,i) = (j-1)*2*pi/count;    
        r(j,i) = r_*i/10;
        for n=0:10
            s = s + sin(n*phi(j,i))*(r(j,i)^n)/((pi*n)^2 - 4);
        end
        u(j,i)=(-pi*a*sin(4*phi(j,i))/2)*s;
    end
end