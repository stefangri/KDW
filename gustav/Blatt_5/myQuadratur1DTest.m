
%GEGEBENE TESTFUNKTION
function y = test_function(x)

  y = 1 ./ x .^ 2;

end


%METHODE DIE ZU EINEM INTERVALL I = [A, B], N ÄQUIDISTANTE STUETZSTELLEN X_I LIEFERT,
%MIT X_0 = A, X_N = B
function [c] = aequi_stuetz(I, n)
  % X_0 = A, X_N = B
  c(1) = I(1);
  c(n) = I(end);

  %h Abstand zwischen Stützstellen
  h = (I(end) - I(1))/(n-1);
  for i = [2:1:(n-1)]
    c(i) = c(i - 1) + h;
  end

end


I = [0.5 1];
h = I(end) - I(1);

%TEST DER METHODE MIT DEN DREI QUADRATUREN AUS 5.1
TRAPEZ = myQuadratur1D(@test_function, [h/4 h/4], aequi_stuetz(I, 2))
SIMPSON = myQuadratur1D(@test_function, [h/6 4*h/6 h/6], aequi_stuetz(I, 3))
NEWTON = myQuadratur1D(@test_function, [h/8 3*h/8 3*h/8 h/8], aequi_stuetz(I, 4))
exact = 1
