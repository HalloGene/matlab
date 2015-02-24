x = 0:0.005:1;
y1 = 0.4 - (cos(100*x) + 3*x)/10;
y2 = -1*y1;


y_l = x-1;
y_r = 1-x;

figure
plot(y_l, x, y_r, x);
title('Fig. 1: Straight approach', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth');
xlabel('supp', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth'); % x-axis label
ylabel('\mu', 'FontSize', 14, 'FontWeight', 'bold',  'FontName', 'FixedWidth'); % y-axis label


figure
plot(x, y_l, x, y_r);
title('Fig. 2: Kosinski aproach', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth');
ylabel('supp', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth'); % y-axis label
xlabel('\mu', 'FontSize', 14, 'FontWeight', 'bold',  'FontName', 'FixedWidth'); % x-axis label


fixedL = fixLeftStraight(y1);
fixedR = fixLeftStraight(y2);
figure
plot(x, y1, x, y2);
title('Fig. 3: Pure function', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth');
ylabel('supp', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth'); % x-axis label
xlabel('\mu', 'FontSize', 14, 'FontWeight', 'bold',  'FontName', 'FixedWidth'); % y-axis label

figure
plot(x, y1, x, y2, x, fixedL, x, fixedR);
title('Fig. 4: Pure and modified function', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth');
ylabel('supp', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth'); % x-axis label
xlabel('\mu', 'FontSize', 14, 'FontWeight', 'bold',  'FontName', 'FixedWidth'); % y-axis label

figure
plot(x, fixedR, x, fixedL);
title('Fig. 5: Modified function', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth');
ylabel('supp', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'FixedWidth'); % x-axis label
xlabel('\mu', 'FontSize', 14, 'FontWeight', 'bold',  'FontName', 'FixedWidth'); % y-axis label