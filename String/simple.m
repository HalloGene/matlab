clc;
fprintf('----------------         parameters           -----------------\n');
a = 1;
T = 100;
t_periods = 10;
t = 0:T/t_periods:T;
h = 1;
n=1:5;
fprintf('a = %f\nT = %f\n', a, T);
fprintf('----------------   precise solution L = 100   -----------------\n');
fprintf('----------------        string partition     ------------------\n');
L = 100;
x = 0:12.125:100;
x_l = x(1:5);
x_r = x(5:9);
fprintf('x =');
disp(x);
t = 0:T/t_periods:T;
u_100 = getU( t, n, h, a, L, x_l, x_r);
fprintf('----------------   precise solution L = 97    -----------------\n');
fprintf('----------------         parameters           -----------------\n');
L2 = 97;
count_points_in_the_halfstring = 5;
x2l  = linspace( 0, L2/2, count_points_in_the_halfstring);
x2r = linspace( L2/2, L2, count_points_in_the_halfstring);
x2 = [x2l x2r];
fprintf('x =');
disp(x2);
fprintf('Time | U \n');
u_97 = getU( t, n, h, a, L2, x2l, x2r);
fprintf('-----------------------   Summary    --------------------------\n');
fprintf('------------------   abs(u_100 - u_97)    ---------------------\n');
diff = abs(u_100 - u_97);
fprintf('---------------------   Fuzzy length    -----------------------\n');
fprintf('-----------------   fuzzy solution L = 97    ------------------\n');

m = 100;
e = 2;
x_ = 90:0.5:110;
l = exp(-((x_ - m).^2)/(2*e^2));
mu = 0.01:0.01:1;
Ll = m - sqrt(-2*(e^2)*log(mu));
Lr = fliplr(m + sqrt(-2*(e^2)*log(mu)));
FL = [Ll Lr];
%plot(x_, l, Ll, mu, Lr, fliplr(mu));

fprintf('Time: %d\n', T);

for T0=0:10:30
for k = 33:length(FL)-1
    L3 = FL(k);
    x3 = 0:12.125:L3;
    x3l = x(1:5);
    x3r = x(5:9);
    if (k > length(mu))
        m = mu(2*length(mu) - k + 1);
    else
        m = mu(k);
    end

    u_fuzzy(k,:) = m * getU( [T0], n, h, a, L3, x3l, x3r);
    fprintf('MU=%f\nL = %f\n', m, L3);
    disp(u_fuzzy(k, :));
end
surface(u_fuzzy);
%M(T0) = getframe;
end

fprintf('-----------------   fuzzy solution L = 97    ------------------\n');
u_97./u_100
fprintf('-----------------   fuzzy solution L = 97    ------------------\n');
 plot(x2, u_97(4,:) - u_100(4, :),'r-');
 hold on;
 plot( x2, u_97(4,:)./u_100(4, :), 'g-');
 hold on;
 %plot( x2, u_fuzzy(33, :)./u_100(4, :), 'b-');
 plot( x2, u_fuzzy(33, :) - u_100(4, :), 'b-');
 hold off;


% u_fuzzy(100,:)
% for i=1:length(FL)-1
%     u_f_rel(i, :) = u_fuzzy(i, :)./u_fuzzy(100,:);
%     L3 = FL(i);
%     if (i > length(mu))
%         m = mu(2*length(mu) - i + 1);
%     else
%         m = mu(i);
%     end
%     if (m > 0.3 && m < 0.35)
%     fprintf('MU=%f\nL = %f\n', m, L3);
%     
%     disp(u_f_rel(i, :));
%     end
% end
% fprintf('-----------------   fuzzy solution L = 97    ------------------\n');
% fprintf('-----------------   fuzzy solution L = 97    ------------------\n');

%---------------- Draw results---------------------------
% m1=min(min(u));
% m2 = max(max(u));
% mm = max(abs([m1 m2]));
%  
% for k = 1:t_periods
%     plot(x, u(:, k), x, u(:, k), 'r-', 'Linewidth', 3);
%     plot(x, u(:, k), x2, u2(:, k), 'Linewidth', 3);
%     axis([ 0 L m1-mm m2+mm] );
%     grid on;
%     M(k) = getframe;
% end
%----------------------------------------------------------