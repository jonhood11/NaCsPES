function out = NaCsb2PES(in)
%Input Bohr, output Hartree
% From [1] J. Zaharova et al, Phys. Rev. A 79, 012508 (2009).

%Input spin-orbit EMO function, eq (17).  This is the same as the PES EMO
%function but with Tdis --> xi and De --> Ve.  Will be added to the b1 PES,
%see paragraph above equation 20

%A01 from table II
xi = 184.68;
rref = 4.6;
Ve = 90.88;
re = 4.399871;
p = 1;
ai = [
0.48369
1.13622
2.67951
3.34248]';

%Convert input Bohr to Angstrom
in = in*0.529177211;

y = @(r) (r.^p - rref.^p)./(r.^p + rref.^p);
alpha = @(r) arrayfun(@(r) sum(ai.*y(r).^(0:(length(ai)-1))), r);
A12 = arrayfun(@(r) (xi - Ve) + Ve*(1 - exp(-alpha(r)*(r-re))).^2, in);

%Remember that other PES functions take bohr and output Hartree.
NaCsb1PES_scaled = @(r) 219474.631*NaCsb1PES(r/0.529177211);

%Other PES functions asymptote to 0, so restore value from papers
out = NaCsb1PES_scaled(in) + A12;

% Set asymptote to 0
% out = out - 1.846800000000000e+02;

% %Convert output to Hartree
out = out/219474.631;

