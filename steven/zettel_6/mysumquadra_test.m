tic
format long
genau= 2/5 * atan(5) %genaues Ergbnis der Integration
f = @(x) 1/(1+25*x^ 2) ; %%% Runge Funktion

for n = [1:1:1000]
  n
  m(n)=n;
trapez(n)= abs(genau-sumquadra(f, [1 1], [-1 1], -1, 1, n)); % Bestimmung für die Trapezregel
simpson(n) = abs(genau-sumquadra(f, [1/3 4/3 1/3], [-1 0 1], -1, 1, n));  % Bestimmung für die Simpsonregel
newton (n)= abs(genau-sumquadra(f,[1/4 3/4 3/4 1/4], [-1 -1/3 1/3 1], -1, 1, n));  % Bestimmung für die Newtonregel
end
%Plotbereich
hold on
loglog(m, trapez, 'b-');
loglog(m, simpson, 'g-');
loglog(m, newton, 'r-');
legend('Trapez','Simpson', 'Newton')
grid()
hold off
print('myQuadraturSum1DPlot.fig')
input('Fertig')
toc
