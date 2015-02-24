function M = dalamber( f, G, a, L, T)
x = linspace( -L, L, 300);
t = linspace( 0, T, 300);
f1 = inline(sprintf(' (%s)', f));
G1 = inline(sprintf(' (%s)', G));

for k = 1:300
    u(:, k)=(f1(x-a*t(k))+f1(x+a*t(k)))/2+1/(2*a)*(G1(x+a*t(k))-G1(x-a*t(k)));
end

m1=min(min(u));
m2 = max(max(u));
mm = 0.15*max(abs([m1 m2]));

for k = 1:300
    plot(x, u(:, k), 'r-', 'Linewidth', 3);
    axis([ -0.7*L 0.7*L m1-mm m2+mm] );
    grid on;
    M(k) = getframe;
end