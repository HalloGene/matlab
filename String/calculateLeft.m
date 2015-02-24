function u = calculateLeft(n, h, a, t, L, x_part)
u = ((-1).^(n+1)*4*h./(n*pi)).*(cos(a*n*pi*t/L))*sin(n'*pi*x_part/L);