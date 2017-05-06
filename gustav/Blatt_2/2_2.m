tic
x = single(0.8 : 1e-4 : 1.2); %Wertemenge
horner_koeffs = [1 -8 28 -56 70 -56 28 -8 1]; %Koeffizienten des Polynoms

%Direkte Berechnung (x - 1).^8
fig_1 = figure('visible', 'off');
plot(x, (x - 1).^8);
title('Berechnung ohne Hornerschema');
xlabel('x');
ylabel('y');
%print('plots/plot_2_2_exact.pdf');

%Berechnung über das Horner Schema
fig_2 = figure('visible', 'off');
plot(x, horner(x, horner_koeffs));
title('Berechnung mit Hornerschema');
xlabel('x');
ylabel('y');
%print('plots/plot_2_2_horner.pdf');
toc
