function u = getU( a, p, q, t, count)

x = 0:p/count:p;
y = 0:q/count:q;

lambda = (pi/p)^2+(pi/q)^2;
for i = 1:length(y)
    for j = 1:length(x)
        u(i,j)=sin(pi*x(i)/p)*sin(pi*y(j)/q)*cos(lambda*a*t);
    end
%   fprintf('%3d',t(k));
%   disp([u3l(:, k)' u3r(:, k)']);
end
