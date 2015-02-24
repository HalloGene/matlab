m = -1:0.1:1;
sigma = 0.1;
mu = 0.5:0.0025:1;

for i=1:length(m)
    mult = 1;%rand(1,1);
    Ll = m(i) - sqrt(-2*((sigma*mult)^2)*log(mu));
    Lr = fliplr(m(i) + sqrt(-2*((sigma*mult)^2)*log(mu)));
    F_Ll = 10*cos(10*Ll);
    F_Lr = 10*cos(10*Lr);
    %F_Ll = Ll.^3;
    %F_Lr = Lr.^3;
    fixedL = fixL(F_Ll);
    fixedR = fixR(F_Lr);
    for j=1:length(Ll)
       plot(m(i), F_Ll(j), 'Marker', 'o', 'Color', [1-mu(j)^4 1-mu(j)^4 1-mu(j)^6]);
       plot(m(i), F_Lr(j), 'Marker', 'o', 'Color', [1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^6]);
       hold on;
    end
end
hold off;
% mo = 0;
%     Ll = mo - sqrt(-2*(sigma^2)*log(mu));
%     Lr = fliplr(mo + sqrt(-2*(sigma^2)*log(mu)));
%     F_Ll = cos(Ll);
%     F_Lr = cos(Lr);
%     fixedL = fixL(F_Ll);
%     fixedR = fixR(F_Lr);
% plot(fixedL, mu, fixedR, fliplr(mu));
%     

% [x, y] = meshgrid(-2:0.1:2, 0.8:0.05:1);
% for i=1:length(x)
%     for j=1:length(y)
%         Z(i,j) = x(i) - sqrt(-2*(sigma^2)*log(y(j)));
%     end
% end
% surf(x, y, Z);