%{
script to run th whole scirpt and save plots
%}
clear; clc;

compute_steadystate;
dynare gen_eq.mod;

% plotting relevant endogenous variables
fields = fieldnames(oo_.irfs);
figure1 = figure;
for i=1:numel(fields)
  if mod(numel(fields),2) == 2
    a = 2;
    b = numel(fields)/2;
  else
    a = 2;
    b = (numel(fields)+1)/2;
  end
  subplot(a, b, i); plot(oo_.irfs.(fields{i})); title(M_.endo_names_long(i,:));
end

subtitle('Impulse Response Functions');

set(figure1,'PaperUnits','inches','PaperPosition',[0 0 10 6]);
saveas(figure1,'irfs.png');
