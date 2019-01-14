function f = steadys(vars0);
    load params;

    %parameters
    cbeta = params(1);
    cdelta = params(2);
    cpsi= params(3);
    cv = params(4);
    cphi = params(5);
    cgamma = params(6);
    clambda = params(7);
    csigma = params(8);
    calpha = params(9);

    %guesses for initial values
    c = vars0(1);
    l = vars0(2);
    k = vars0(3);
    w = vars0(4);
    r = vars0(5);
    A = vars0(6);
    vpi = vars0(7);
    g = vars0(8);

    f = zeros(1, 8);

    %functions to minimize to find steady states
    f(1) = cbeta * (1 + r  - cdelta) - 1;
    f(2) = l^cv - w * c^(-cphi)/cpsi;
    f(3) = g - (cgamma - 1) * clambda * (clambda * csigma * vpi)^(csigma/(1 - csigma));
    f(4) = A - (1+g)* A;
    f(5) = k - (calpha^2/r)^(1/(1 - calpha)) * l * A;
    f(6) = w - (1 - calpha) * l^(-calpha) * k;
    f(7) = y - k - c;
    f(8) = k - (1 - cdelta) * k;
end
