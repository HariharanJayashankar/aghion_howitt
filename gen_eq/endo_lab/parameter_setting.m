% parameters
cbeta = 0.96;
cdelta = 0.1;
calpha = 0.33;
cgamma = 1.2;
clambda= 1;
csigma = 0.8;
ctheta = 0.9;
cnu = 1.50;
cpsi = 6.50;

%policy params
etau_k = 0; etau_l = 0;

params = [cbeta cdelta calpha cgamma clambda csigma ctheta cnu cpsi];
policy = [etau_k, etau_l];

save('params.mat', 'params', 'policy');
