x = single(0.8 : 1e-4 : 1.2);
horner_koeffs = [1 -8 28 -56 70 -56 28 -8 1];

fig_1 = figure('visible', 'off');
plot(x, (x - 1).^8);
title('Berechnung ohne Hornerschema');
xlabel('x');
ylabel('y');
print('plots/plot_2_2_exact.pdf');


fig_2 = figure('visible', 'off');
plot(x, horner(x, horner_koeffs));
title('Berechnung mit Hornerschema');
xlabel('x');
ylabel('y');
print('plots/plot_2_2_horner.pdf');
