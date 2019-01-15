function f = steadys(vars0);
    load params;

    %parameters
    cbeta = params(1);
    cdelta = params(2);
    cphi = params(3);
    cgamma = params(4);
    clambda = params(5);
    csigma = params(6);
    calpha = params(7);
    etau = params(8);

    %guesses for initial values
    c = vars0(1);
    k = vars0(2);
    r = vars0(3);
    vpi = vars0(4);
    g = vars0(5);
    y = vars0(6);

    f = zeros(1, 6);

    %functions to minimize to find steady states
    f(1) = cbeta * (1 + r*(1 - etau)  - cdelta)*(1+g)^(-cphi) - 1;
    f(2) = g - (cgamma - 1) * clambda * (clambda * csigma * vpi)^(csigma/(1 - csigma));
    f(3) = y - k^calpha;
    f(4) = k - (calpha/r)^(1/(1 - calpha));
    f(5) = vpi - calpha * (1 - calpha) * k^calpha;
    f(6) = y - c + k - k/(1+g);
end
