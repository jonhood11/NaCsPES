%% Import Korek 2007 NaCs PES's 
%first column is r in units bohr's radiu.  1 a0 =  5.2917721067×10?11 m
%rest of the columns are energies in units Hartree (a.u.), 
%1 Hartree = 219474.6313702 cm?1 or 6579.683920711 THz 

h = 219474.6313702;  %1 hartree in cm^-1
au =  0.52917721067; %1 a0 =  5.2917721067e?11 m

path = 'C:\Users\jonho\OneDrive\LEVEL16\NaCs SMs\Allouche2007\NaCsSO\';
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
figure;
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
%figure;
set(gcf,'color','w');
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


%% Print PES as text for LEVEL
data = dataSO0p;
dataArray = [ au*data{1} , data{2}*h - os]';  %[Angstr, cm^-1 ; ...]

clear str str2; 
str(1) = " 11 23 55 133 0 1         % IAN1 IMN1 IAN2 IMN2 CHARGE NUMPOT";
str(2) = "'Case 1: NaCs Omega=1(0+)'";
str(3) = " 0.001 1.6 99. 1.d-06     % RH RMIN RMAX EPS";
str(4) = " 476 -1 0 0               % NTP LPPOT IOMEG VLIM";
str(5) = " -1 0 3 6 0.D5            % NUSE IR2 ILR NCN CNN";
str(6) = " 1D0 1D0 0.d0             % RFACT EFACT VSHIFT";
% % turning points 
str2(1) =" -1000 1 0 0 0 0 -0 -1 0 0 % NLEV1 AUTO1 LCDC LXPCT NJM JDJR IWR LPRWF";

fileID = fopen('dataLEVELtest.txt','w');
fprintf(fileID, '%s\n',str)
fprintf(fileID, '  %f %f \n', dataArray );  %define turning points for LEVEL
fprintf(fileID, '%s\n',str2)

fclose(fileID);


