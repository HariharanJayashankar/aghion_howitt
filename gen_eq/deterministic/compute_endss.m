% inital val guess
vars0 = [1, 1, 5.5, 0.2, 1];

params = [cbeta, cdelta, calpha, cgamma, clambda, csigma, etaue];
paramsend = [cbeta, cdelta, calpha, cgamma, clambda, csigma, etaue];

save('paramsend.mat', 'paramsend');

f = @steadys;
[xend, fval, exitflag] = fsolve(f, vars0);

xend = real(xend);
save('xend.mat', 'xend');
