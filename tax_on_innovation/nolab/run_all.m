clear; clc;

% == Initializing parameters == %

cbeta = 0.96;
cdelta = 0.1;
calpha = 0.33;
cgamma = 1.2;
clambda= 1;
csigma = 0.8;
ctheta = 0.9;

params = [cbeta cdelta calpha cgamma clambda csigma ctheta];

save('params.mat', 'params');

% == Finding steady state of variables == %

vars0 = ones(1, 6);
f = @steadys;
[vars_ss, fval, exitflag] = fsolve(f, vars0);

vars_ss = real(vars_ss);
save('vars_ss.mat', 'vars_ss');

% == Calling Dynare == %
dynare detrended_model.mod
