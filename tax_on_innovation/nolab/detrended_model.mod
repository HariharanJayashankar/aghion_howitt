// vars
var r g etau_k;
trend_var(growth_factor=1+g) A;
var(deflator=A) k y c;

varexo eps_tauk;

// parameters
parameters cbeta cdelta calpha cgamma clambda csigma;

load params;
load vars_ss;

// setting params
cbeta = params(1);
cdelta = params(2);
calpha = params(3);
cgamma = params(4);
clambda= params(5);
csigma = params(6);
ctheta = params(7);

// model
model;
// HH Euler
(1/c(+1))*cbeta*(r(+1)*(1-etau_k) + 1 - cdelta) = (1+g(+1))/c;

// Goods market clearing
y = c + k- k(-1)*(1 - cdelta);

// Capital Market clearing
r = (k(-1)/A(-1))^(calpha-1)*calpha^2;

// production function for final good
y = A(-1)^(1 - calpha) * k(-1)^calpha;

// growth rate
g = (cgamma - 1) * clambda * (csigma*clambda*(calpha - 1) * (k(-1)/A(-1))^calpha)^(csigma/(1-csigma));

// tau k process
etau_k = etau_k(-1) - eps_tauk;
end;


initval;
c = vars_ss(1);
y = vars_ss(2);
k = vars_ss(3);
g = vars_ss(4);
r = vars_ss(5);
etau_k = vars_ss(1);
end;
steady;
resid;
check;

// Sets shocks
shocks;
var eps_tauk;
stderr 0.8;
end;


// solve
stoch_simul(order=1, periods = 1000, irf = 100);

// Plotting
figure('name','Response to a Change in Capital Tax Rate', 'position', [0, 0, 800, 200]);
set(gcf, 'PaperPosition', [0 0 8 2]);
set(gcf, 'PaperSize', [8 2]);
subplot(1,2,1);
plot(g_eps_tauk);
title('Growth Rate/Innovation Rate');
ylim([0 0.02]);
axis tight;
subplot(1,2,2);
plot(k_eps_tauk);
title('Capital Stock');
ylim([0 0.6]);
axis tight;
saveas(gcf, "../../product/irfs_nolab.pdf");
