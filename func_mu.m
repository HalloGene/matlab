function u = func_mu(x,y, alpha)
m = 10;
sigma = 0.8;
mu = alpha:0.1:1;
Ll = m - sqrt(-2*(sigma^2)*log(mu));
Lr = fliplr(m + sqrt(-2*(sigma^2)*log(mu)));
FL = [Ll Lr];
F_Ll = Ll.^2;
F_Lr = Lr.^2;




% for i=1:length(x)
%     for j=1:length(y)
%     u(i,j) = 0;
%     if (x(i)^2 == y(j)) 
%         u(i,j) = 1;
%     end
%     end
% end