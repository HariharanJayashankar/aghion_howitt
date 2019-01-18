% parameters
cbeta = 0.96;
cdelta = 0.1;
calpha = 0.33;
cgamma = 1.2;
clambda= 1;
csigma = 0.8;
ctheta = 0.9;

%policy params
etau_k = 0;

params = [cbeta cdelta calpha cgamma clambda csigma ctheta];
policy = [etau_k];

save('params.mat', 'params', 'policy');
