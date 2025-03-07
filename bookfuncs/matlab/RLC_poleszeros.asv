syms Lp Rp Z0 Cp s

z = roots([ Lp ,(Rp-Z0) ,1/Cp])
p = roots([ Lp ,(Rp+Z0) ,1/Cp])

zeors1_func = matlabFunction(z(1), 'Vars', [Lp Rp Z0 Cp]);
zeors2_func = matlabFunction(z(2), 'Vars', [Lp  Rp Z0 Cp]);

poles1_func = matlabFunction(p(1), 'Vars', [Lp  Rp Z0 Cp]);
poles2_func = matlabFunction(p(2), 'Vars', [Lp  Rp Z0 Cp]);
simplify(z(2))
% Now you can use the numeric_function to evaluate the expression numerically
Lp_val =0.7e-9;
Ld_val = 2e-6;
Rp_val=1;
Z0=120*pi;
Cp_val=1e-12

z1 = -zeors1_func(Lp_val,Rp_val,Z0,Cp_val)/(2*pi)
z2 = -zeors2_func(Lp_val, Rp_val,Z0,Cp_val)/(2*pi)


p1 = -poles1_func(Lp_val, Ld_val,Rp_val,Z0,Cp_val)/(2*pi)
p2 = -poles2_func(Lp_val, Ld_val,Rp_val,Z0,Cp_val)/(2*pi)
