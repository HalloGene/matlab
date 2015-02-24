clc;
a = 1;
r_initial = 1;
n = 1:10;
count = 100;

[ r, phi, u] = getU( a, r_initial, n, count);
[ x, y, z] = pol2cart( phi, r, u);
surf(x, y, z);

r_m = 1;
e = 2;
mu = 0.01:0.01:1;
r_l = r_m - sqrt(-2*(e^2)*log(mu));
r_r = fliplr(r_m + sqrt(-2*(e^2)*log(mu)));
F_r = [r_l r_r];



for k = 1:length(F_r)
    [ r, phi, u] = getU( a, F_r(k), n, count);
    [ x, y, z] = pol2cart( phi, r, u);    
end
