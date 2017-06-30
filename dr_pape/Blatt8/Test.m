### Testskript ###


f = @(x) (cos(2 * x)**2 - x**2);

df = @(x) (- 4 * sin(2 * x) * cos(2 * x) - 2 * x);

a = 0;
b = 0.75;

[x_bisec, err_bisec, v_bisec] = mybisect(f, a, b)


[x_newton, err_newton, v_newton] = myNewton(f, df, 0.75)



fig = figure('visible', 'on');
semilogy(1:1:40, err_bisec, 'b*');
hold on;
semilogy(1:1:5, err_newton, 'k*');
legend ('Bisektionsverfahren', 'Newton-Verfahren');
xlabel('Anzahl der Iterationsschritte n');
ylabel('|x_n - x_{n-1}|');
print(['PA8.3.fig']);


### Bermerkungen ###

# Die beobachtete Konvergenzgeschwindigkeit stimmt mit der erwarteten
# Konvergenzgeschwindigkeit überein. Das Newton-Verfahren konvergiert
# deutlich schneller als das Bisektionsverfahren.