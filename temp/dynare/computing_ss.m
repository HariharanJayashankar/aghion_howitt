vars0 = [1, 1, 1, 1];

s= 0.5;
cdelta= 0.3;
cgamma= 2;
clambda= 2;
csigma= 0.8;
calpha= 0.3;

params = [s, cdelta, cgamma, clambda, csigma, calpha];

save('params.mat', 'params');

f = @ch5_steadyS;
[xss, fval, exitflag] = fsolve(f, vars0);

save('xss.mat', 'xss');
