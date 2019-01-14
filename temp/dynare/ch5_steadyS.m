function f = ch5_steadyS(initvars);

  load params;
  k = initvars(1);
  g = initvars(2);
  vpi = initvars(3);

  s = params(1);
  cdelta = params(2);
  cgamma = params(3);
  clambda = params(4);
  csigma = params(5);
  calpha = params(6);

  f = zeros(1, 3);
  f(1) = k *(1 + g) - s * k - (1 - cdelta)*k;
  f(2) = g - (cgamma - 1) * clambda * (csigma * clambda * vpi) ^ (csigma/(1 - csigma));
  f(3) = vpi - calpha * (1 - calpha) * k ^ calpha;

end;
