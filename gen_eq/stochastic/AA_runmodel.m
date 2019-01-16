%{
script to run th whole scirpt and save plots
%}

compute_steadystate;
dynare gen_eq.mod;


% plotting relevant endogenous variables

subplot(2, 3, 1); plot(oo_.irfs.y_etau); title('Y/A');
subplot(2, 3, 2); plot(oo_.irfs.c_etau); title('C/A');
subplot(2, 3, 3); plot(oo_.irfs.r_etau); title('Rate of Return on Capital');
subplot(2, 3, 4); plot(oo_.irfs.k_etau); title('K/A');
subplot(2, 3, 5); plot(oo_.irfs.g_etau); title('Growth Rate');
subtitle('Impulse Response Functions')

print('irfs', '-dpng')
