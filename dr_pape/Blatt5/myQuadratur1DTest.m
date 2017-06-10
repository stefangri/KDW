### Skript zum Testen der numerischen Integration ###

### Definition der zu integrierenden Funktion ###

f = @(x) (1 ./ x.^2); # x Elemtent von (0.5, 1)

# Funktion als function_handle

### Intervalllänge ###

h = 0.5;

### Intervallgrenzen ###

a = 0.5;
b = 1;

### Trapez-Regel ###

# Stützstellen

x_trapez = a:0.5:b;

# Gewichte

w_trapez = h * [1 / 2, 1 / 2];

# Ausführen der numerischen Integration für die Trapezregel

trapez_int = myQuadratur1D(f, w_trapez, x_trapez)

### Simpson-Regel ###

# Stützstellen

x_simpson = a:1 / 4:b;

# Gewichte

w_simpson = h * [1 / 6, 4 / 6, 1 / 6];

# Ausführen der numerischen Integration für die Simpson-Regel

simpson_int = myQuadratur1D(f, w_simpson, x_simpson)

### Newton's-3/8-Regel ###

# Stützstellen

x_newton = a:1 / 6:b;

# Gewichte

w_newton = h * [1 / 8, 3 / 8, 3 / 8, 1 / 8];

# Ausführen der numerischen Integration für Newton's-3/8-Regel

newton_int = myQuadratur1D(f, w_newton, x_newton)

### Exakte Integration ###

exakte_int = 1