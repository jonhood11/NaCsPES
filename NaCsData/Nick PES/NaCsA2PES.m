function U = NaCsA2PES(r)
%PES for the (2)A1\Sigma state
%Input Bohr, output Hartree
%From [1] J. Zaharova et al., Phys. Rev. A 79, 012508 (2009).
% See table 1 and equations 15, 16

Tdis = 16501.87;
rref = 4.65;
Te = 10509.810;
De = 5992.060;
re = 4.65431678872284;
p = 3;
ai = [
0.409201927134440e0
-0.316930094322587e-1
0.118889237998245e0
0.272082736776197e0
0.206826824112031e0
-0.147778977004416e0
-0.491933649692577e0
0.288158643376113e-2
0.839886790201783e0
0.358215463426036e0]';

%Convert input Bohr to Angstrom
r = r*0.529177211;

y = @(r) (r.^p - rref.^p)./(r.^p + rref.^p);
alpha = @(r) arrayfun(@(r) sum(ai.*y(r).^(0:(length(ai)-1))), r);
U = arrayfun(@(r) (Tdis - De) + De*(1 - exp(-alpha(r)*(r-re))).^2, r);

%Set potential of S+S Na+Cs asymptote to be 0
U = U - 4954.24;

%Convert cm^-1 to Hartree
U = U/219474.631;