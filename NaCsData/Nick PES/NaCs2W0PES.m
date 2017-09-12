function out = NaCs2W0PES(in)
%Input Bohr, output Hartree
% From [1] J. Zaharova et al, Phys. Rev. A 79, 012508 (2009).


%Input spin-orbit EMO function, eq (17).  This is the same as the PES EMO
%function but with Tdis --> xi and De --> Ve

xi = 184.6796480;
rref = 4.8;
Ve = 95.88;
re = 4.851716;
p = 1;
ai = [
0.34334
-0.29306
-1.31449
5.67884
14.01202]';

%Convert input Bohr to Angstrom
in = in*0.529177211;

y = @(r) (r.^p - rref.^p)./(r.^p + rref.^p);
alpha = @(r) arrayfun(@(r) sum(ai.*y(r).^(0:(length(ai)-1))), r);
xiso = arrayfun(@(r) (xi - Ve) + Ve*(1 - exp(-alpha(r)*(r-re))).^2, in);

%Remember that other PES functions take bohr and output Hartree.
NaCsA2PES_scaled = @(r) 219474.631*NaCsA2PES(r/0.529177211);
NaCsb0PES_scaled = @(r) 219474.631*NaCsb0PES(r/0.529177211);

out = 0.5*(NaCsA2PES_scaled(in) + NaCsb0PES_scaled(in) ...
    - sqrt(((NaCsA2PES_scaled(in) - NaCsb0PES_scaled(in)).^2) ...
    +8*xiso.^2));

% %Set asymptote to 0
% out = out-1.613251046933329e+04;

% %Convert output to Hartree
out = out/219474.631;