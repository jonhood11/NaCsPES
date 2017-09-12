clf;

r = linspace(3, 20, 200);
UX = arrayfun( @NaCsXPES , r ) ;
plot(r,UX);
xlabel('r (a_0)');
ylabel('E (cm^{-1})');


Ua = arrayfun( @NaCsaPES , r ) ;
hold on; 
plot(r,Ua);
hold off; 

ylim([min(UX),.01])

%%





