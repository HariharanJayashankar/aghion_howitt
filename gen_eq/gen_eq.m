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
M_.fname = 'gen_eq';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('gen_eq.log');
M_.exo_names = 'etau';
M_.exo_names_tex = 'etau';
M_.exo_names_long = 'etau';
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'vpi');
M_.endo_names_tex = char(M_.endo_names_tex, 'vpi');
M_.endo_names_long = char(M_.endo_names_long, 'vpi');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_partitions = struct();
M_.param_names = 'cbeta';
M_.param_names_tex = 'cbeta';
M_.param_names_long = 'cbeta';
M_.param_names = char(M_.param_names, 'cdelta');
M_.param_names_tex = char(M_.param_names_tex, 'cdelta');
M_.param_names_long = char(M_.param_names_long, 'cdelta');
M_.param_names = char(M_.param_names, 'cphi');
M_.param_names_tex = char(M_.param_names_tex, 'cphi');
M_.param_names_long = char(M_.param_names_long, 'cphi');
M_.param_names = char(M_.param_names, 'cgamma');
M_.param_names_tex = char(M_.param_names_tex, 'cgamma');
M_.param_names_long = char(M_.param_names_long, 'cgamma');
M_.param_names = char(M_.param_names, 'clambda');
M_.param_names_tex = char(M_.param_names_tex, 'clambda');
M_.param_names_long = char(M_.param_names_long, 'clambda');
M_.param_names = char(M_.param_names, 'csigma');
M_.param_names_tex = char(M_.param_names_tex, 'csigma');
M_.param_names_long = char(M_.param_names_long, 'csigma');
M_.param_names = char(M_.param_names, 'calpha');
M_.param_names_tex = char(M_.param_names_tex, 'calpha');
M_.param_names_long = char(M_.param_names_long, 'calpha');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 7;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('gen_eq_static');
erase_compiled_function('gen_eq_dynamic');
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 2 8;
 0 3 0;
 1 4 0;
 0 5 9;
 0 6 0;
 0 7 0;]';
M_.nstatic = 3;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 1;
M_.ndynamic   = 3;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(7, 1);
M_.NNZDerivatives = [18; 0; -1];
load params;
load paramsend;
load xinit;
load xend;
M_.params( 1 ) = params(1);
cbeta = M_.params( 1 );
M_.params( 2 ) = params(2);
cdelta = M_.params( 2 );
M_.params( 3 ) = params(3);
cphi = M_.params( 3 );
M_.params( 4 ) = params(4);
cgamma = M_.params( 4 );
M_.params( 5 ) = params(5);
clambda = M_.params( 5 );
M_.params( 6 ) = params(6);
csigma = M_.params( 6 );
M_.params( 7 ) = params(7);
calpha = M_.params( 7 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = xinit(1);
oo_.steady_state( 3 ) = xinit(2);
oo_.steady_state( 4 ) = xinit(3);
oo_.steady_state( 5 ) = xinit(4);
oo_.steady_state( 6 ) = xinit(5);
oo_.steady_state( 2 ) = xinit(6);
oo_.exo_steady_state( 1 ) = params(8);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
resid;
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.steady_state( 1 ) = xend(1);
oo_.steady_state( 3 ) = xend(2);
oo_.steady_state( 4 ) = xend(3);
oo_.steady_state( 5 ) = xend(4);
oo_.steady_state( 6 ) = xend(5);
oo_.steady_state( 2 ) = xend(6);
oo_.exo_steady_state( 1 ) = paramsend(8);
resid;
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:20,'value',0) ];
M_.exo_det_length = 0;
options_.periods = 100;
perfect_foresight_setup;
perfect_foresight_solver;
save('gen_eq_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('gen_eq_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('gen_eq_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('gen_eq_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('gen_eq_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('gen_eq_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('gen_eq_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
