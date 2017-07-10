### Skript zur numerischen Evaluation der Fixpunktiteration ###

format long

g = @(x) (1 / 6 * x**3 + 1 / 3 * x**2 + 1 / 6);

### Gesucht ist der Fixpunkt von g ###
### N = 8 aus Aufgabenteil c.), aber x_0 entspricht x(1) somit ist n = 9 ###

x(1) = 0;

for n = [2:1:9]

  x(n) = g(x(n - 1));
  err(n - 1) = abs(x(n) - x(n - 1));

end

printf('Iterationswerte für x_n: ')
x

printf('Fehler |x_n - x_{n-1}|:')
err

### Anhand des Fehlers ist deutlich, dass das Verfahren gegen den
### Fixpunkt konvergiert.