function U = NaCsaPES(r, re)
% function U = NaCsaPES(r, re) Potential energy surface for NaCs a state,
% from [1] O. Docenko, M. Tamanis, J. Zaharova, R. Ferber, A. Pashov, H.
% Knöckel, and E. Tiemann, J. Phys. B At. Mol. Opt. Phys. 39, S929 (2006)..
% r is internuclear distance in bohr radii (atomic units), re is optional
% argument to shift potential; leave empty to use re = 0, use re = [] to
% use re = 5.7448 angstrom, the equilibrium distance (i.e. potential
% minimum will be at 0).  Output is in Hartree (atomic units). Nick
% Hutzler, 12 April 2015

if nargin > 1
    if isempty(re)
        re = 5.7448/0.529177211;
    end
    r = r + re;
end

%r is in angstroms, energy in cm^-1 for Docenko2006 JPB paper. Convert r to angstrom
r = r*0.529177211;

if any(r) < 0
    error('r must be positive')
end

U = arrayfun(@(x) NaCsaPES_Single(x), r);

% U is in cm^-1, convert to Hartree
U = U/219474.631;


end

function U = NaCsaPES_Single(r)

if r <= 4.78
    A = -1.47429182E+03;
    B = 1.60029429E+05;
    U = A+B./r^3;
elseif r < 10.20
    b = -0.6400;
    Rm	= 5.75585938;
    a =  [-217.1544
        0.506003697108497441E+01
        0.471868074288336629E+03
        0.251421896658343968E+03
        -0.874623764194756603E+02
        -0.215412551480785680E+03
        -0.237001094676986327E+03
        -0.597552181866083515E+03
        -0.476013801913782288E+03
        0.378229284864475233E+03
        0.679827008567800476E+03
        0.672327249787527307E+03
        -0.124756939670013161E+02
        -0.462561066282073739E+03];
    j = (1:length(a)) - 1;
    U = sum(a'.*((r-Rm)/(r+b*Rm)).^j);
else
    C6 = 1.555214E+07;
    C8 = 4.967239E+08;
    C10 = 1.971387E+10;
    Aex = 2.549087E+04;
    gamma = 5.12271;
    beta = 2.17237;
    U = -C6/r^6-C8/r.^8-C10./r.^10+Aex*r^gamma*exp(-beta*r);
end

end