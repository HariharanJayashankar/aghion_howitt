/*
Toy Aghion and Howit Model based on:
http://www.uq.edu.au/economics/AJEE/docs/Volume%2009,%20Number%202,%202012/2.%20Teaching%20Aghion%20and%20Howitt's%20Model%20of%20Schumpeterian%20Growth%20to%20Graduate%20Students%20-%20Mario%20da%20Silva.pdf
(Teaching AH to UG and grad students)
*/

//****************************************************************************
//Define variables
//****************************************************************************

var y x A w_r prof_tilda n w g;

//****************************************************************************
//Define predetermined variables
//****************************************************************************

predetermined_variables n A;

//****************************************************************************
//Define parameters
//****************************************************************************

parameters calpha clambda cgamma r L;

//****************************************************************************
//set parameters
//****************************************************************************

calpha = 0.33;
clambda = 1/5000;
cgamma = 1.5;
r = 0.02;
L = 5000;

//****************************************************************************
//enter the model equations (model-block)
//****************************************************************************
model;
  y = A * x^calpha;
  x = (calpha^2/w_r)^(1/(1 - calpha));
  w_r = clambda * (cgamma * prof_tilda(+1))/(r + clambda * n(+1));
  n = L - x;
  w_r = w/A;
  prof_tilda = ((1 - calpha)/calpha) * ((calpha^2)/(w_r)^calpha)^(1/(1 - calpha));
  A(+1) = cgamma * A;
  g = clambda * n * log(cgamma);
end;

//****************************************************************************
//initval-block: set initial condition of n to 80% of steady state value
//****************************************************************************

initval;
  n = 0.8 * ((clambda * cgamma * ((1 - calpha)/calpha) * L) - r)/clambda * (1 + cgamma * (1 - calpha)/calpha);
  g = clambda * n * log(cgamma);
  x = L - n;
  A = 1;
  w = 1;
  w_r = w/A;
  prof_tilda = ((1 - calpha)/calpha) * ((calpha^2)/(w_r)^calpha)^(1/(1 - calpha));
  y = A * x^calpha;
end;

//****************************************************************************
//endval-block: set initial condition of n to 80% of steady state value
//****************************************************************************

endval;
  n = ((clambda * cgamma * ((1 - calpha)/calpha) * L) - r)/clambda * (1 + cgamma * (1 - calpha)/calpha);
  g = clambda * n * log(cgamma);
end;

//****************************************************************************
//perfect_foresight_solver
//****************************************************************************

perfect_foresight_setup(periods=200);
perfect_foresight_solver;
