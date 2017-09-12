
%% Import fort.9, E(v) and rotational constants
%outputs a string array
filename = 'C:\Users\jonho\OneDrive\NaCsPES\LEVEL\fort.9';
startRow = 5;
formatSpec = '%4s %5s %12s %14s %15s %15s %15s %15s %15s %s %[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
fort = [dataArray{1:end-1}];
clearvars filename startRow endRow formatSpec fileID dataArray ans;

fort(1,:) =[]; %delete row of ====
fort = cellstr(fort); %convert to cell array
whos fort

% Convert string array to numbers
clear data;
rotData = cellfun( @str2num, fort );

c = 299792458;
IcmToGHz = (1/c)*1e10;

figure(1);
plot( rotData(:,1) , rotData(:,3), '.-' ) 
xlabel('v'); ylabel('E (cm^{-1})');     

figure(1);
plot( rotData(:,1) , rotData(:,3)*IcmToGHz, '.-' ) 
xlabel('v'); ylabel('E (GHz)');     

figure(2);
plot( rotData(:,1) , rotData(:,4), '.-' )
xlabel('v'); ylabel('Bv (cm^{-1})');

figure(2);
plot( rotData(:,1) , rotData(:,4)*IcmToGHz , '.-' )
xlabel('v'); ylabel('Bv (GHz)');


%% Import fort.10, Wave function amplitudes
filename = 'C:\Users\jonho\OneDrive\NaCsPES\LEVEL\fort.10';
fileID = fopen(filename,'r');
clear s; s = struct;
headerlines = textscan(fileID, '%s', 4 ,'Delimiter','\n');

m=1; 
while (~feof(fileID))
    
    inputtext = textscan(fileID, '  Level  v=  %f  J= %f  E=%f , wave function at %f points.', 1 ,'Delimiter','');
    [s(m).v, s(m).J, s(m).E, s(m).NumPoints] = deal(inputtext{:});
    
    inputtext = textscan(fileID, '  R(1-st)=  %f  mesh= %f  NBEG= %f |LPRWF|= %f', 1 ,'Delimiter','');
    [s(m).Rst, s(m).mesh, s(m).NBEG, s(m).LPRWF] = deal(inputtext{:});
    
    inputtext = textscan(fileID, '%f %f', s(m).NumPoints, 'Delimiter', '');
    [s(m).R, s(m).WF] = deal(inputtext{:});
    
    eob = textscan(fileID,'%s',1,'delimiter','\n');
    m=m+1;
end
fclose(fileID);
whos s

% Plot wavefunctions
figure(5); clf;
Enorm =max(abs([s.E]))/length(s); 
hold on;
for m=1:length(s)
    plot( s(m).R , s(m).WF + s(m).E/Enorm );
end
hold off; 

plot([s.E]/max(abs([s.E])) );
xlabel('R (Angstr)'); ylabel('Wavefunction amp');
title('');

%% Import potentials

