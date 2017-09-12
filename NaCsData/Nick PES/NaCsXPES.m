function U = NaCsXPES(r)
% function U = NaCsXPES(r)
% Potential energy surface for NaCs X state, from
% 10.1088/0953-4075/39/19/S08.  r is internuclear distance in bohr radii
% (atomic units)  Output is in Hartree (atomic units). Nick Hutzler, 12
% April 2015


%r is in angstroms, energy in cm^-1 for Docenko2006 JPB paper. Convert r to angstrom
r = r*0.529177211;

if any(r) < 0
    error('r must be positive')
end

U = arrayfun(@(x) NaCsXPES_Single(x), r);

% U is in cm^-1, convert to Hartree
U = U/219474.631;


end

function U = NaCsXPES_Single(r)

if r <= 2.8435
    A = -1.21078258E+04;
    B = 2.78126476E+05;
    U = A+B./r^3;
elseif r < 10.20
    b = -0.4000;
    Rm	= 3.85062906;
    a =  [-4954.2371
        0.898622630664361211E+00
        0.151732217891396431E+05
        0.109102058285656531E+05
        -0.245830537231665448E+04
        -0.160823217089854061E+05
        -0.870501233606598180E+04
        0.218804990209799216E+05
        -0.300253857509134803E+06
        -0.786934963816004456E+06
        0.339616569903816981E+07
        0.735840978670415096E+07
        -0.263747841089096293E+08
        -0.445851022516661808E+08
        0.135133668337616146E+09
        0.176262771092477173E+09
        -0.475687819616745651E+09
        -0.447488331948895991E+09
        0.121600043788157034E+10
        0.746075686887681842E+09
        -0.229173358027149439E+10
        -0.870893701850213766E+09
        0.309544152674965858E+10
        0.819954477849331141E+09
        -0.280675451799400091E+10
        -0.696373131358783245E+09
        0.151653591696465230E+10
        0.444558275107226551E+09
        -0.366990899674986184E+09
        -0.135243476249383062E+09];
    j = (1:length(a)) - 1;
    U = sum(a'.*((r-Rm)/(r+b*Rm)).^j);
else
    C6 = 1.555214E+07;
    C8 = 4.967239E+08;
    C10 = 1.971387E+10;
    Aex = 2.549087E+04;
    gamma = 5.12271;
    beta = 2.17237;
    U = -C6/r^6-C8/r.^8-C10./r.^10-Aex*r^gamma*exp(-beta*r);
end

end