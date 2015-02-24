function u = getU(t, n, h, a, L, x_l, x_r)
%fprintf('Time | U \n');
for k = 1:length(t)
    u_l(:, k)=calculateLeft( n, h, a, t(k), L, x_l);
    u_r(:, k)=calculateRight( n, h, a, t(k), L, x_r);
%   fprintf('%3d',t(k));
%   disp([u3l(:, k)' u3r(:, k)']);
end
u = [u_l' u_r'];