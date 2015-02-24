n = 10;
%------ sin(nx)
x = -1:0.0125:1;
y = sin(n*x);
%plot(x,y);
%------ n*cos(nx)
%y = n*cos(n*x);
%plot(x,y);
%------ Fuzzy n*cos(nx)
% m = x;
% sigma = 0.1;
% mu = 0.5:0.125:1;
% 
% for i=1:length(m)
%     mult = 1;
%     Ll = m(i) - sqrt(-2*((sigma*mult)^2)*log(mu));
%     Lr = fliplr(m(i) + sqrt(-2*((sigma*mult)^2)*log(mu)));
%     F_Ll = n*cos(n*Ll);
%     F_Lr = n*cos(n*Lr);
%     fixedL = fixL(F_Ll);
%     fixedR = fixR(F_Lr);
%     for j=1:length(Ll)
%        plot(m(i), fixedL(j), 'Marker', 'o', 'Color', [1-mu(j)^4 1-mu(j)^4 1-mu(j)^6]);
%        plot(m(i), fixedR(j), 'Marker', 'o', 'Color', [1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^6]);
%        hold on;
%     end
% end
%------ Fuzzy n*cos(nx) by def
m = x;
sigma = 0.5;
mu = 0.5:0.0125:1;

difference = 0;
for i=2:length(m)
    mult = 1;
    Ll_2 = m(i) - sqrt(-2*((sigma*mult)^2)*log(mu));
    Lr_2 = fliplr(m(i) + sqrt(-2*((sigma*mult)^2)*log(mu)));
    F_Ll_2 = Ll_2.*Ll_2;% sin(Ll_2);
    F_Lr_2 = Lr_2.*Lr_2;%sin(Lr_2);
    fixedL2 = fixLeftStraight(F_Ll_2); %fixLeftStraight 
    fixedR2 = fixRightStraight(F_Lr_2); %fixRightStraight
    %fixedL2 = fixL(F_Ll_2); %fixLeftStraight 
    %fixedR2 = fixR(F_Lr_2); %fixRightStraight

    
    Ll_1 = m(i-1) - sqrt(-2*((sigma*mult)^2)*log(mu));
    Lr_1 = fliplr(m(i-1) + sqrt(-2*((sigma*mult)^2)*log(mu)));
    F_Ll_1 = sin(n*Ll_1);
    F_Lr_1 = sin(n*Lr_1);
    fixedL1 = fixLeftStraight(F_Ll_1);
    fixedR1 = fixRightStraight(F_Lr_1);
    
    fixedL_ = fixLeftStraight(F_Ll_2 - F_Ll_1);
    fixedR_ = fixRightStraight(F_Lr_2 - F_Lr_1);
    Ll = Ll_2 - Ll_1;
    Lr = Lr_2 - Lr_1;
    
    derL = fixedL_./Ll;
    derR = fixedR_./Lr;

     Ll2d = m(i) - sqrt(-2*((sigma*mult)^2)*log(mu));
     Lr2d = fliplr(m(i) + sqrt(-2*((sigma*mult)^2)*log(mu)));    
     F_Ll2d = n*cos(n*Ll2d);
     F_Lr2d = n*cos(n*Lr2d);
     fixedL2d = fixLeftStraight(F_Ll2d);
     fixedR2d = fixRightStraight(F_Lr2d);

    
    for j=1:length(derL)
       %plot(m(i), derL(j), 'Marker', 'o', 'Color', [1-mu(j)^4 1-mu(j)^4 1-mu(j)^6]);
       %plot(m(i), derR(j), 'Marker', 'o', 'Color', [1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^6]);
       
       plot(m(i), fixedL2(j), 'Color', [1-mu(j)^4 1-mu(j)^4 1-mu(j)^6]);
       plot(m(i), fixedR2(j), 'Color', [1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^4 1-mu(length(Ll)-j+1)^6]);
       
       hold on;
    end
    
    difR = abs(derR - fixedR2d)./abs(derR);
    difL = abs(derL - fixedL2d)./abs(derL);
    
    ((sum(difR)-abs(max(difR))-abs(min(difR)))/(length(difR) - 2))
    ((sum(difL)-abs(max(difL))-abs(min(difL)))/(length(difL) - 2))
    
    difference = difference + (((sum(difR)-max(abs(difR))-min(abs(difR)))/(length(difR) - 2)) + ((sum(difL)-max(abs(difL))-min(abs(difL)))/(length(difL) - 2)))/2
    i
    difference/i
end
difference/length(m)
