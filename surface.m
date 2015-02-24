[x, mu] = meshgrid(-2:0.125:2, 0.5:0.125:1);

for i=1:length(x)
    mult = 1;
    Ll_2 = x(i) - sqrt(-2*((sigma*mult)^2)*log(mu));
    Lr_2 = fliplr(x(i) + sqrt(-2*((sigma*mult)^2)*log(mu)));
    F_Ll_2 = Ll_2.*Ll_2;
    F_Lr_2 = Lr_2.*Lr_2;
    fixedL2 = fixLeftStraight(F_Ll_2);
    fixedR2 = fixLeftStraight(F_Lr_2);
    z(i,:) = fixedL2;
end
surf(x, mu, z);