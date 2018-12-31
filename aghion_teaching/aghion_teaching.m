%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'aghion_teaching';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('aghion_teaching.log');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, 'x');
M_.endo_names_long = char(M_.endo_names_long, 'x');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'w_r');
M_.endo_names_tex = char(M_.endo_names_tex, 'w\_r');
M_.endo_names_long = char(M_.endo_names_long, 'w_r');
M_.endo_names = char(M_.endo_names, 'prof_tilda');
M_.endo_names_tex = char(M_.endo_names_tex, 'prof\_tilda');
M_.endo_names_long = char(M_.endo_names_long, 'prof_tilda');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_partitions = struct();
M_.param_names = 'calpha';
M_.param_names_tex = 'calpha';
M_.param_names_long = 'calpha';
M_.param_names = char(M_.param_names, 'clambda');
M_.param_names_tex = char(M_.param_names_tex, 'clambda');
M_.param_names_long = char(M_.param_names_long, 'clambda');
M_.param_names = char(M_.param_names, 'cgamma');
M_.param_names_tex = char(M_.param_names_tex, 'cgamma');
M_.param_names_long = char(M_.param_names_long, 'cgamma');
M_.param_names = char(M_.param_names, 'r');
M_.param_names_tex = char(M_.param_names_tex, 'r');
M_.param_names_long = char(M_.param_names_long, 'r');
M_.param_names = char(M_.param_names, 'L');
M_.param_names_tex = char(M_.param_names_tex, 'L');
M_.param_names_long = char(M_.param_names_long, 'L');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 0;
M_.endo_nbr = 8;
M_.param_nbr = 5;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_.predetermined_variables = [ 3 6 ];
M_.Sigma_e = zeros(0, 0);
M_.Correlation_matrix = eye(0, 0);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('aghion_teaching_static');
erase_compiled_function('aghion_teaching_dynamic');
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 0;
 1 5 0;
 0 6 0;
 0 7 11;
 2 8 0;
 0 9 0;
 0 10 0;]';
M_.nstatic = 5;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 1;
M_.nspred   = 2;
M_.ndynamic   = 3;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:0];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(0, 1);
M_.params = NaN(5, 1);
M_.NNZDerivatives = [19; 0; -1];
M_.params( 1 ) = 0.33;
calpha = M_.params( 1 );
M_.params( 2 ) = 0.0002;
clambda = M_.params( 2 );
M_.params( 3 ) = 1.5;
cgamma = M_.params( 3 );
M_.params( 4 ) = 0.02;
r = M_.params( 4 );
M_.params( 5 ) = 5000;
L = M_.params( 5 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 6 ) = 0.8*(M_.params(2)*M_.params(3)*(1-M_.params(1))/M_.params(1)*M_.params(5)-M_.params(4))/M_.params(2)*(1+M_.params(3)*(1-M_.params(1))/M_.params(1));
oo_.steady_state( 8 ) = M_.params(2)*oo_.steady_state(6)*log(M_.params(3));
oo_.steady_state( 2 ) = M_.params(5)-oo_.steady_state(6);
oo_.steady_state( 3 ) = 1;
oo_.steady_state( 7 ) = 1;
oo_.steady_state( 4 ) = oo_.steady_state(7)/oo_.steady_state(3);
oo_.steady_state( 5 ) = (1-M_.params(1))/M_.params(1)*(M_.params(1)^2/oo_.steady_state(4)^M_.params(1))^(1/(1-M_.params(1)));
oo_.steady_state( 1 ) = oo_.steady_state(3)*oo_.steady_state(2)^M_.params(1);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.steady_state( 6 ) = (1+M_.params(3)*(1-M_.params(1))/M_.params(1))*(M_.params(2)*M_.params(3)*(1-M_.params(1))/M_.params(1)*M_.params(5)-M_.params(4))/M_.params(2);
oo_.steady_state( 8 ) = M_.params(2)*oo_.steady_state(6)*log(M_.params(3));
options_.periods = 200;
perfect_foresight_setup;
perfect_foresight_solver;
save('aghion_teaching_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('aghion_teaching_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('aghion_teaching_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('aghion_teaching_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('aghion_teaching_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('aghion_teaching_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('aghion_teaching_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
