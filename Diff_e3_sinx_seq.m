n = 10;
%------ sin(nx)
x = -pi:0.01:pi;
y = sin(x);
%plot(x,y);
%------ n*cos(nx)
y = n*cos(n*x);
%plot(x,y);
%------ Fuzzy n*cos(nx)
 m = x;
 sigma = 1;
 mu = 0.5:0.125:1;

 difference = 0;
for i=1:length(m)
    mult = 1;
    Ll = m(i) - sqrt(-2*((sigma*mult)^2)*log(mu));
    Lr = fliplr(m(i) + sqrt(-2*((sigma*mult)^2)*log(mu)));
    F_Ll = seq_sin(Ll);% + sin(Ll) + sin(Ll);
    F_Lr = seq_sin(Lr);% + sin(Lr) + sin(Lr);
    
    F_Ll2 = sin(Ll);% + sin(Ll) + sin(Ll);
    F_Lr2 = sin(Lr);% + sin(Lr) + sin(Lr);
    
    fixedL = fixLeftStraight(F_Ll);
    fixedR = fixRightStraight(F_Lr);
    
    fixedL2 = fixLeftStraight(F_Ll2);
    fixedR2 = fixRightStraight(F_Lr2);
    
    for j=1:length(Ll)
       plot(m(i), fixedL(j), 'Marker', 'o', 'Color', [1-mu(j)^4 1-mu(j)^4 1-mu(j)^6]);
       plot(m(i), fixedR(j), 'Marker', 'o', 'Color', [1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^6]);
       hold on;
    end
    
    difference = difference + sum((fixedR - fixedR2).^2 + (fixedL - fixedL2).^2);
end
difference

%------ Fuzzy n*cos(nx) by def
% m = x;
% sigma = 2;
% mu = 0.5:0.125:1;
% 
% for i=2:length(m)
%     mult = 1;
%     Ll_2 = m(i) - sqrt(-2*((sigma*mult)^2)*log(mu));
%     Lr_2 = fliplr(m(i) + sqrt(-2*((sigma*mult)^2)*log(mu)));
%     F_Ll_2 = sin(n*Ll_2);
%     F_Lr_2 = sin(n*Lr_2);
%     fixedL2 = fixL(F_Ll_2);
%     fixedR2 = fixR(F_Lr_2);
% 
%     Ll_1 = m(i-1) - sqrt(-2*((sigma*mult)^2)*log(mu));
%     Lr_1 = fliplr(m(i-1) + sqrt(-2*((sigma*mult)^2)*log(mu)));
%     F_Ll_1 = sin(n*Ll_1);
%     F_Lr_1 = sin(n*Lr_1);
%     fixedL1 = fixL(F_Ll_1);
%     fixedR1 = fixR(F_Lr_1);
%     
%     fixedL_ = fixL(F_Ll_2 - F_Ll_1);
%     fixedR_ = fixR(F_Lr_2 - F_Lr_1);
%     Ll = Ll_2 - Ll_1;
%     Lr = Lr_2 - Lr_1;
%     
%     derL = fixedL_./Ll;
%     derR = fixedR_./Lr;
%     
%     for j=1:length(derL)
%        plot(m(i), derL(j), 'Marker', 'o', 'Color', [1-mu(j)^4 1-mu(j)^4 1-mu(j)^6]);
%        plot(m(i), derR(j), 'Marker', 'o', 'Color', [1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^6]);
%        hold on;
%     end
% end
% 