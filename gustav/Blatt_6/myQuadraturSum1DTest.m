tic
%GEGEBENE TESTFUNKTION
function y = runge(x)

  y = 1 ./ (1 + 25 .*x.^ 2);

end


N = [1:1:2];
TRAPEZ = myQuadraturSum1D(@runge, [1/2 1/2], [0 1], -1, 1, N);
SIMPSON = myQuadraturSum1D(@runge, [1/6 4/6 1/6], [0 1/2 1], -1, 1, N);
NEWTON = myQuadraturSum1D(@runge, [1/8 3/8 3/8 1/8], [0 1/3 2/3 1], -1, 1, N);

exact = 2/5 * atan(5)

fig = figure('visible', 'off');
loglog(N, abs(TRAPEZ - exact), 'g-');
hold on;
loglog(N, abs(SIMPSON - exact), 'b-');
loglog(N, abs(NEWTON - exact), 'r-');
legend ('TRAPEZ', 'SIMPSON', 'NEWTON', 'location', 'northeastoutside');
print('myQuadraturSum1DPlot.fig')



toc
