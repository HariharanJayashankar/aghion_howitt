% inital val guess
vars0 = ones(1, 6);

% parameters
cbeta = 0.96;
cdelta = 0.1;
cphi = 2;
cgamma = 1.1;
clambda = 2;
csigma = 0.8;
calpha = 0.33;
etaui = 0;
etaue = 0.5;

params = [cbeta cdelta cphi cgamma clambda csigma calpha etaui];

save('params.mat', 'params');

f = @steadys;
[xinit, fval, exitflag] = fsolve(f, vars0);

save('xinit.mat', 'xinit');

%%%%%%%%%%%%%% end values %%%%%%%%%%%%%%
params = [cbeta cdelta cphi cgamma clambda csigma calpha etaue];
paramsend = [cbeta cdelta cphi cgamma clambda csigma calpha etaue];

save('paramsend.mat', 'paramsend');

f = @steadys;
[xend, fval, exitflag] = fsolve(f, vars0);

save('xend.mat', 'xend');
