% inital val guess
vars0 = ones(1, 9);

% parameters
cbeta = 0.96;
cdelta = 0.1;
cpsi= 1;
cv = 2;
cphi = 2;
cgamma = 1.1;
clambda = 2;
csigma = 0.8;
calpha = 0.33;

params = [cbeta cdelta cpsi cv cphi cgamma clambda csigma calpha];

save('params.mat', 'params');

f = @steadys;
[xss, fval, exitflag] = fsolve(f, vars0);

save('xss.mat', 'xss');
