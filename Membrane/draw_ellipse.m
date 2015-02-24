a = 0.25;
phi = 0:0.05:2*pi+0.05;
r = 1./sqrt(1-(1-(a/1)^2)*cos(phi).^2);

[x, y] = pol2cart(phi, r);
plot(x, y);