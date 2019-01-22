'''
modify params and init values. Test file
'''
import os
os.chdir('C:/Users/admin/Documents/personal/aghion/gen_eq/python/')


replace = {'cbeta_params' : 0.99,
        'cdelta_params': 0.1 ,
        'calpha_params' : 0.33 ,
        'cgamma_params' : 1.2 ,
        'clambda_params' : 1.0 ,
        'csigma_params' : 0.8 ,
        'ctheta_params' : 0.9,
        'cnu_params' : 1.50,
        'cpsi_params' : 6.50,
        'c_xinit' : 0,
        'y_xinit' : 0,
        'k_xinit' : 0,
        'g_xinit' : 0,
        'r_xinit' : 0,
        'l_xinit' : 0,
        'w_xinit' : 0,
        'etau_k_policy' : 0,
        'etau_l_policy' : 0}

with open('model_in.mod', "rt") as fin:
    with open('model_out.mod', "wt") as fout:
        for line in fin:
            line = line.rstrip()
            if not line:
                continue
            for f_key, f_value in replace.items():
                if f_key in line:
                    line = line.replace(f_key, f"{f_value}")
            print(line)
            fout.write(line + '\n')
