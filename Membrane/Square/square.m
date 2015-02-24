clc;

a = 1;
p = 2;
q = 3;
t = 0.5;
count = 20;

x = 0:p/count:p;
y = 0:q/count:q;
u = getU( a, p, q, t, count);

surf( x, y, u);
