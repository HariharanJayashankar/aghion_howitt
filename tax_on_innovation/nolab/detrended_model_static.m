function [residual, g1, g2, g3] = detrended_model_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 6, 1);

%
% Model equations
%

T21 = params(1)*1/(y(6)*(1+y(2)));
T29 = 1/(1+y(2));
T35 = params(3)^2;
T36 = y(4)*T29/T29;
T42 = T29^(1-params(3));
T43 = (y(4)*T29)^params(3);
T54 = (params(3)-1)*params(5)*params(6)*T36^params(3);
lhs =(1+y(1)*(1-y(3))-params(2))*T21;
rhs =(1+y(2))/y(6);
residual(1)= lhs-rhs;
lhs =y(5);
rhs =y(6)+y(4)-(1-params(2))*y(4)*T29;
residual(2)= lhs-rhs;
lhs =y(1);
rhs =T35*T36^(params(3)-1);
residual(3)= lhs-rhs;
lhs =y(5);
rhs =T42*T43;
residual(4)= lhs-rhs;
lhs =y(2);
rhs =(params(4)-1)*params(5)*T54^(params(6)/(1-params(6)));
residual(5)= lhs-rhs;
lhs =y(3);
rhs =y(3)-x(1);
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

T72 = (-1)/((1+y(2))*(1+y(2)));
T81 = getPowerDeriv(T36,params(3)-1,1);
T87 = getPowerDeriv(y(4)*T29,params(3),1);
T93 = getPowerDeriv(T36,params(3),1);
T96 = getPowerDeriv(T54,params(6)/(1-params(6)),1);
  g1(1,1)=(1-y(3))*T21;
  g1(1,2)=(1+y(1)*(1-y(3))-params(2))*params(1)*(-y(6))/(y(6)*(1+y(2))*y(6)*(1+y(2)))-1/y(6);
  g1(1,3)=T21*(-y(1));
  g1(1,6)=(1+y(1)*(1-y(3))-params(2))*params(1)*(-(1+y(2)))/(y(6)*(1+y(2))*y(6)*(1+y(2)))-(-(1+y(2)))/(y(6)*y(6));
  g1(2,2)=(1-params(2))*y(4)*T72;
  g1(2,4)=(-(1-(1-params(2))*T29));
  g1(2,5)=1;
  g1(2,6)=(-1);
  g1(3,1)=1;
  g1(3,2)=(-(T35*(T29*y(4)*T72-y(4)*T29*T72)/(T29*T29)*T81));
  g1(3,4)=(-(T35*T81));
  g1(4,2)=(-(T43*T72*getPowerDeriv(T29,1-params(3),1)+T42*y(4)*T72*T87));
  g1(4,4)=(-(T42*T29*T87));
  g1(4,5)=1;
  g1(5,2)=1-(params(4)-1)*params(5)*(params(3)-1)*params(5)*params(6)*(T29*y(4)*T72-y(4)*T29*T72)/(T29*T29)*T93*T96;
  g1(5,4)=(-((params(4)-1)*params(5)*T96*(params(3)-1)*params(5)*params(6)*T93));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,36);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,216);
end
end
end
end
