function f = get_ss(vars_init);

    load params;

    % parameters
    cbeta =  params(1);
    cdelta = params(2);
    calpha = params(3);
    cgamma = params(4);
    clambda = params(5);
    csigma = params(6);
    ctheta = params(7);
    cnu = params(8);
    cpsi = params(9);
    cG_0 = params(10);
    etau_l = params(11);

    % initial values
    c = vars_init(1);
    y = vars_init(2);
    k = vars_init(3);
    g = vars_init(4);
    r = vars_init(5);
    l = vars_init(6);
    w = vars_init(7);
    etau_k = vars_init(8);
    A = 1;

    % steady state equations
    f = zeros(1, size(vars_init)(2));

    % HH Euler
    f(1) = (1/c)*cbeta*(r*(1-etau_k) + 1 - cdelta) - (1+g)/c;

    % Goods market clearing
    f(2) = y - c - k- k*(1 - cdelta);

    % Capital Market clearing
    f(3) = r - (k/l * A)^(calpha-1)*calpha^2;

    % production function for final good
    f(4) = y - (A * l)^(1 - calpha) * k^calpha;

    % growth rate
    f(5) = g - (cgamma - 1) * clambda * (csigma*clambda*(calpha - 1) * (k/l * A)^calpha)^(csigma/(1-csigma));

    % FOC HH wrt l
    f(6) = 1/c - cpsi * l^cnu/w * (1 - etau_l);

    % labour market clearing
    f(7) = w - (1 - calpha)* A^(1 - calpha) * (k/l)^calpha;

    % Government constriant
    f(8) = -cG_0 + etau_k * k * r + etau_l * l * w;

    % capital tax shock
    f(9) = etau_k - 0.99 * etau_k;


end;