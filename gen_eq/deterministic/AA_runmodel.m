%{
1. Runs matlab script to compute steady states
2. Runs dynare code to simulate model
%}

compute_steadystate;
compute_endss;
dynare gen_eq.mod;
