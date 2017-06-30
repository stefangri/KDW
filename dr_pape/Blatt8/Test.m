### Testskript ###


f = @(x) (cos(2 * x)**2 - x**2);

df = @(x) (- 4 * sin(2 * x) * cos(2 * x) - 2 * x);

a = 0;
b = 0.75;

[x_bisec, err_bisec, v_bisec] = mybisect(f, a, b)


[x_newton, err_Newton, v_Newton] = myNewton(f, df, 0.75)