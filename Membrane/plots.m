a_m = 1;
e = 1;


mu = 0.1:0.05:1;
al = a_m + sqrt(-2*(e^2)*log(mu));
ar = a_m - sqrt(-2*(e^2)*log(mu));


% plot(al, mu, ar, mu, 'r-', 'Linewidth', 3);
% title('Fuzzy number');
% xlabel('X');
% ylabel('Mu');



plot(mu, al, mu, ar, 'r-', 'Linewidth', 3);
title('Fuzzy number: W. Kosinski concept');
xlabel('Mu');
ylabel('X');