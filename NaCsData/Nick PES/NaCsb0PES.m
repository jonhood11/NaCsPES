function U = NaCsb0PES(r)
%Input Bohr, output Hartree
%From [1] J. Zaharova et al., Phys. Rev. A 79, 012508 (2009).
% See table 1 and equations 15, 16


Tdis = 16317.19;
rref = 3.78;
Te = 10236.048;
De = 6081.142;
re = 3.77999922692013;
p = 3;
ai = [
0.665828316447219e0
0.159655197110690e0
0.144813242483051e0
0.964993864916689e-1
-0.452724688520158e-2
0.320383473138789e0
0.148834980740537e1
-0.180900998067171e1
-0.388373323943793e0]';

%Convert input Bohr to Angstrom
r = r*0.529177211;

y = @(r) (r.^p - rref.^p)./(r.^p + rref.^p);
alpha = @(r) arrayfun(@(r) sum(ai.*y(r).^(0:(length(ai)-1))), r);
U = arrayfun(@(r) (Tdis - De) + De*(1 - exp(-alpha(r)*(r-re))).^2, r);

%Set potential of S+S Na+Cs asymptote to be 0
U = U - 4954.24;

%Convert cm^-1 to Hartree
U = U/219474.631;