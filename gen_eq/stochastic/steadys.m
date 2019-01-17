function f = steadys(vars0);
    load params;

    %parameters
    cbeta = params(1);
    cdelta = params(2);
    calpha = params(3);
    cgamma = params(4);
    clambda= params(5);
    csigma = params(6);
    ctheta = params(7);
    G_0 = params(8);

    %guesses for initial values
    c = vars0(1);
    y = vars0(2);
    k = vars0(3);
    g = vars0(4);
    r = vars0(5);
    etau = vars0(6);

    f = zeros(1, length(vars0));

    %% functions to minimize to find steady states
    % HH Euler
    f(1) = (1/c)*cbeta*(r + 1 - cdelta) - (1+g)/c;

    % Goods market clearing
    f(2) = y - c - k*(1 + g) + k*(1-cdelta);

    % Capital Market clearing
    f(3) = r - (k)^(calpha-1)*calpha^2;

    % production function for final good
    f(4) = y - k^calpha;

    % growth rate
    f(5) = g - (cgamma - 1) * clambda * (csigma*clambda*(calpha - 1) * k^calpha)^(csigma/(1-csigma));

    % government constraint
    f(6) = G_0 - etau * r * k;
end
