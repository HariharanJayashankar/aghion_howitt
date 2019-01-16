% inital val guess
vars0 = [1, 1, 5.5, 0.2, 1];

% parameters
cbeta = 0.96;
cdelta = 0.1;
calpha = 0.33;
cgamma = 1.2;
clambda= 1;
csigma = 0.8;
etaui = 0;
etaue = 0.7;

params = [cbeta, cdelta, calpha, cgamma, clambda, csigma, etaui];

save('params.mat', 'params');

f = @steadys;
[xinit, fval, exitflag] = fsolve(f, vars0);

xinit = real(xinit);
save('xinit.mat', 'xinit');
