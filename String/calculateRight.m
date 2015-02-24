function u = calculateRight(n, h, a, t, L, x_part)
u = (4*h./(n*pi)).*(cos(a*n*pi*t/L))*sin(n'*pi*x_part/L);