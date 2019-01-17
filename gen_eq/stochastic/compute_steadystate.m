% inital val guess
vars0 = [1, 1, 1, 1, 1, 1];

% parameters
cbeta = 0.96;
cdelta = 0.1;
calpha = 0.33;
cgamma = 1.2;
clambda= 1;
csigma = 0.8;
ctheta = 0.9;
G_0 =  2.5;

params = [cbeta cdelta calpha cgamma clambda csigma ctheta G_0];

save('params.mat', 'params');

f = @steadys;
[xinit, fval, exitflag] = fsolve(f, vars0);

xinit = real(xinit);
save('xinit.mat', 'xinit');
