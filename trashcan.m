m = pi/2 - 0.5;
sigma = 2;
%x_ = 90:0.5:110;
%l = exp(-((x_ - m).^2)/(2*e^2));
mu = 0.7:0.01:1;
mult = 1;
Ll = m - sqrt(-2*((sigma*mult)^2)*log(mu));
Lr = fliplr(m + sqrt(-2*((sigma*mult)^2)*log(mu)));
F_Ll = cos(Ll);
F_Lr = cos(Lr);    
fixedL = fixLeftStraight(F_Ll);%fixL(F_Ll);
fixedR = fixRightStraight(F_Lr);

fixedL = fixLeftStraight(F_Ll);%fixL(F_Ll);
fixedR = fixRightStraight(F_Lr);

FL = [Ll Lr];
plot(F_Ll, mu, F_Lr, fliplr(mu));
hold on;
plot(fixedL, mu, fixedR, fliplr(mu));

%F_Ll1 = cos(Ll);
%F_Lr1 = cos(Lr);    
%fixedL = fixL(F_Ll);
%fixedR = fixR(F_Lr);

a = 3;
%plot(a.^Ll, mu, a.^Lr, fliplr(mu));
%seq_sin(pi/2)