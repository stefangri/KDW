### Skript zum Testen der zusammengesetzten Quadratur ###


### Funktion ###

f = @(x) 1 ./ (1 .+ 25 * x.**2);

### Intervall ###

x = -1:0.01:1;

a = min(x);
b = max(x);

# Anzahlt der Teilintervalle

N = 2;
h = (b - a) / N;

### Trapez-Regel ###

# Stützstellen

p_trapez = 0:1:1;

# Gewichte

w_trapez = h * [1 / 2, 1 / 2];


# Ausführen der numerischen Integration für die Trapezregel

trapez_int = myQuadraturSum1D(f, w_trapez, p_trapez, a, b, N)

### Simpson-Regel ###

# Stützstellen

p_simpson = 0:1 / 2:1;

# Gewichte

w_simpson = h * [1 / 6, 4 / 6, 1 / 6];

# Ausführen der numerischen Integration für die Simpson-Regel

simpson_int = myQuadraturSum1D(f, w_simpson, p_simpson, a, b, N)

### Newton's-3/8-Regel ###

# Stützstellen

p_newton = 0:1 / 3:1;

# Gewichte

w_newton = h * [1 / 8, 3 / 8, 3 / 8, 1 / 8];

# Ausführen der numerischen Integration für Newton's-3/8-Regel

newton_int = myQuadraturSum1D(f, w_newton, p_newton, a, b, N)


### Exakt###

2 / 5 * atan(5)
