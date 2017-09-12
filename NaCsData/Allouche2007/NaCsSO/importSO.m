%% Import Korek 2007 NaCs PES's 
%first column is r in units bohr's radiu.  1 a0 =  5.2917721067×10?11 m
%rest of the columns are energies in units Hartree (a.u.), 
%1 Hartree = 219474.6313702 cm?1 or 6579.683920711 THz 

h = 219474.6313702;  %1 hartree in cm^-1
au =  0.52917721067; %1 a0 =  5.2917721067e?11 m

%path = 'C:\Users\jonho\OneDrive\LEVEL16\NaCs SMs\Allouche2007\NaCsSO\';
path = '';
delimiter = '\t';

%SO+
filename = [path, 'SO0+.txt'];
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);
clearvars filename formatSpec fileID ans;
dataSO0p = dataArray;

%SO-
filename = [path, 'SO0-.txt'];
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);
clearvars filename formatSpec fileID ans;
dataSO0m = dataArray;

%S01
filename = [path, 'SO1.txt'];
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);
clearvars filename formatSpec fileID ans;
dataSO1 = dataArray;

%S02
filename = [path, 'SO2.txt'];
formatSpec = '%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);
clearvars filename formatSpec fileID ans;
dataSO2 = dataArray;

%S03
filename = [path, 'SO3.txt'];
formatSpec = '%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);
clearvars filename formatSpec fileID ans;
dataSO3 = dataArray;

%% Plot all PES
os = min( dataSO0p{2} )*h;
figure; set(gcf,'color','w');
hold on;

data = dataSO0m;
for m=2:length(data)-1
    plot( au*data{1}, data{m}*h - os );
end

data = dataSO0p;
for m=2:length(data)-1
    plot( au*data{1}, data{m}*h - os  );
end


data = dataSO1;
for m=2:length(data)-1
    plot( au*data{1}, data{m}*h - os  );
end

data = dataSO2;
for m=2:length(data)-1
    plot( au*data{1}, data{m}*h - os  );
end

data = dataSO3;
for m=2:length(data)-1
    plot( au*data{1}, data{m}*h - os  );
end

xlabel('R (A^0)');
ylabel('E (cm^{-1})');
title('Korek 2007 NaCs with SO Theory');

%% Plot ground and 6Cs PES
os = min( dataSO0p{2} )*h;
figure; set(gcf,'color','w');
colors = get(gca,'colororder');
clf;
hold on;

data = dataSO0p;
for m=2:4
    plot( au*data{1}, data{m}*h - os , 'Color', colors(1,:) );
end

data = dataSO0m;
for m=2:4
    plot( au*data{1}, data{m}*h - os , 'Color', colors(2,:));
end

data = dataSO1;
for m=2:5
    plot( au*data{1}, data{m}*h - os , 'Color', colors(3,:) );
end

data = dataSO2;
for m=2:2
    plot( au*data{1}, data{m}*h - os , 'Color', colors(4,:) );
end

xlabel('R (A^0)');
ylabel('E (cm^{-1})');
title('Korek 2007 NaCs with SO Theory');
%legend({'X1\Sigma','a3\Sigma','1\Sigma'});


%% LEVEL input guide
%READ 1
% IAN1/2 = 11/55 for Na/Cs. integer atomic number of atoms 1/2.
% IMN1/2 = 23/133 for Na/Cs. integer mass numer of atoms 1/2.
% CHARGE = 0; %total charge on molecule. 
% NUMPOT = 1,2; number of potentials. 1 for single potential, 2 for
%   calculating matrix elements coupling bewteen levels.
%READ 4
% TITL = 'Title string' Up to 78 char on single line.
%READ 5
% RH = 0.001. numerical integration mesh size. (Angstr)
% RMIN = 1.6. Inner limit
% RMAX = 99. Outer limit.  RMAX is set to min of RMAX or largest distance
%    allowed by RMIN, RH, and array dimension NDIMR
% EPS = Eigenvalue convergence (cm^-1). Use 2 order of mag below desired
%   uncertainity.
%READ 6
% NTP > 0. Numer of turning points.  If <0, uses analytic potential and
%   skips reads 7-9. 
% LPPOT = 0. Controls printing of potential array. 0: no printing. If >0,
%   write potntial and its first 2 derivative-by-difference to standard
%   output channel 6 at every LPPOT'th mesh point. If <0, writes potential in
%   condensed format to Channel 8 at every |LPPOT|th mesh point (good for
%   plotting)
% OMEGA = 0,1,2. Integer projection of the electronic angular momentum onto
%   molecular axis.  
% VLIM = 0; absolute energy (cm^-1) of the potential asymptote.
%READ 7
% NUSE =-1; specicies how interpolation is done. >0 is NUSE-point piecewise
%   polynomials. <=0 is cubic spline interpolation. For precise/smooth input
%   use NUSE=8,10,12. For less precise point, use NUSE=4 or NUSE <=0. 
% IR2 = 0; for very steep repulsive pot walls, better to interpolate r^2
%   V(r). Try turning on and off to see interpolation noise.
% ILR = 3 specifies how to extrapolate from outermost read-in turning points
%   to RMAX. =3 fits outmerost 2 or 3 points to sum of 2 or 3 inverse-power
%   terms, V(r) = VLIM - sum_m=0^ILR-1 C_(NCN+2m)/r^(NCN+2m).
% NCN = 6; see ILR. 
% CNN = 0; Setting CNN != 0 uses CNN for C instead of fitted value. 
%READ 8
% RFACT/EFACT = 1.0D+0; multiplicative factor required to convert units of NTP
%   pos/energies to A and cm^-1.
% VSHIFT= 0.D0; %energy shift to be added to input pot energies to make
%   consistent with VLIM
%READ 9
% (XI(I), YI(I), I= 1, NTP)  % read in turning points (angst, cm^-1)
%READ 10-23 for analytic pontentials
%READ 24
% NLEV1 = -1000. If >0, number of vibrational or vibrot levels to be
%    calculated. quantum numer specication are then in Read 25. 
%    If <=0, program finds all vib levels from v=0-|NLEV1| assocaited with
%    rot quantum number read in as IJ(1). If NLEV is very large and
%    negative, will find all possible vib levels with J = IJ(1). 
% AUTO1 = 1.  >0 program generates realistic trial eigenvalues. If <0 or
%   fail, then need to input trial energy GV(i) in Read 25b.
% LCDC = 0.  If >0, calculte rotational constant and centrifugal constants 
%   to output Channel 9. 
% LXPCT = 0, Integer controlling matrix elements to be calc. =0 is none. 
%   Read this later.
% NJM / JDJR = 0 / 0; Calculate rotational levels.
%   Read this later.
% IWR = 0,-1;  Integer controller printout diagnostics and calc dtails. If !=0
%   print warning and error message inside SCHRQ. 
%   If >=1 print final eigenvalue and node count for every levels
%   If >=2, print end-of-range wave function amplitudes.
%   If >=3, print intermediate trial eigenvalues as convergence proceeds.
% LPRWF = -1; If >0, write to Chan 6 the wavefuction of every levels at every 
%   LPRWF'th mesh oint. If <0, write wf to Chan 10 at every |LPRWF|'th mesh
%   point.
%READ 25a
% IV(1) / IJ(1) = 0 / 0.  If NLEV<=0, read one pair. Value of IV(1) is
%    ignored, but IJ(1) is rot quantum number for all vib levels. 

%% Print PES as text for LEVEL guide v1
%define PES
data = dataSO0p;
os = data{2}(end)*h; %define zero energy as assymptote. Need to get actual value. 
if 0
    plot( au*data{1} , data{2}*h - os );
    xlabel('R (Angstr)'); ylabel('E (cm^{-1})');
end
dataArray = [ au*data{1} , data{2}*h - os]';  %[Angstr, cm^-1 ; ...]
NTP = length(data{1} );

% define strings
clear str str2; 
str(1) = " 11 23 55 133 0 1         % IAN1 IMN1 IAN2 IMN2 CHARGE NUMPOT";
str(2) = "'Case 1: NaCs Omega=1(0+)'";
str(3) = " 0.001 2.0 15. 1.d-06     % RH RMIN RMAX EPS";
str(4) = " " + num2str(NTP) + " -10 0 0               % NTP LPPOT IOMEG VLIM";
str(5) = " -1 0 3 6 0.D5            % NUSE IR2 ILR NCN CNN";
str(6) = " 1D0 1D0 0.d0             % RFACT EFACT VSHIFT"; 

str2(1) =" -1000 1 1 0 0 0 -1 -1     % NLEV1 AUTO1 LCDC LXPCT NJM JDJR IWR LPRWF";  %LCDC > 0 for E and rot in **.9 
str2(2) =" 0 0                      % IV(1) IJ(1)"; %not sure about this. 

% write to file
fileID = fopen('dataLEVELSO0p.txt','w');
fprintf(fileID, '%s\n',str);
fprintf(fileID, '  %f %f \n', dataArray );  %define turning points for LEVEL
fprintf(fileID, '\n');  
fprintf(fileID, '%s\n',str2);
fprintf(fileID, '\n');  
fclose(fileID);
