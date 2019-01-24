function f = steadys(vars0);
    load params;
    load policy;

    %parameters
    cbeta = params(1);
    cdelta = params(2);
    calpha = params(3);
    cgamma = params(4);
    clambda= params(5);
    csigma = params(6);
    ctheta = params(7);
    cnu = params(8);
    cpsi = params(9);

    % Government policy params
    etau_k = policy(1);
    etau_l = policy(2);

    %guesses for initial values
    c = vars0(1);
    y = vars0(2);
    k = vars0(3);
    g = vars0(4);
    r = vars0(5);
    l = vars0(6);
    w = vars0(7);

    f = zeros(1, length(vars0));

    %% functions to minimize to find steady states
    % HH Euler
    f(1) = (1/c)*cbeta*(r + 1 - cdelta) - (1+g)/c;

    % Goods market clearing
    f(2) = y - c - k*(1 + g) + k*(1-cdelta);

    % Capital Market clearing
    f(3) = k - (calpha^2/r)^(1/(1 - calpha)) * l;

    % production function for final good
    f(4) = y - k^calpha * l^(1 - calpha);

    % growth rate
    f(5) = g - (cgamma - 1) * clambda * (csigma*clambda*(calpha - 1) * (k/l)^calpha)^(csigma/(1-csigma));

    % FOC HH wrt l
    f(6) = 1/c - cpsi * l^cnu/w;

    % labour market clearing
    f(7) = w - (1 - calpha)*(k/l)^calpha;
end
