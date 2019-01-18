load params;

% inital val guess
vars0 = [1, 1, 1, 1, 1];

%solving for steadystate
f = @steadys;
[xinit, fval, exitflag] = fsolve(f, vars0);

xinit = real(xinit);
save('xinit.mat', 'xinit');
