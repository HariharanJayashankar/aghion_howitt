%{
Defines the function which unpacks the initial conditions and uses them
to define the equilibrium defining equations for the steady state
%}

function f = steadyS(var0):

  %extracting 'vars' vector
  k = var0(1);
  l = var0(2);
  c = var0(3);
  q = var0(4);
  y = var0(5);
  

  %initializing the equations to solve
  f = int16.empty(6,0)
  %final goods output equation

  %defining the equations to solve
  f(1) = k*q + c +  G_0 - Omega * y - (1.0 -  delta) * k
  f(2) = c * q - ( beta * c * (1.0 + (1.0 - tau_k) *  alpha * y/k -  delta))
  f(3) = phi * c * (lab^(1.0 +  eta)) - ((1.0 - tau_l)* ((1.0 -  alpha)/ lambda) * y)
  f(4) = y - k ^  alpha * lab ^ (1.0 -  alpha)
  f(5) = G_0 - ( ((1.0 -  alpha)/ lambda) * tau_l +  alpha * tau_k ) * y
  f(6) = q - ( 1.0 + (( lambda - 1.0)/ lambda) * ((1 -  alpha)/ psi)* y )
end
