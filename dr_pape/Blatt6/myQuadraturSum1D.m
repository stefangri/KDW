### Zusammengesetzte Quadratur ###
### Parameter: f: zu integrierende Funktion, w: Gewichte (Dimension R),
### p: Stützstellen (Dimension R),
### a: untere Integralgrenze, b: obere Integralgrenze,
### N: Anzahl der Teilintervalle
### mit I_i = [a + (i - 1) * h, a + i * h] und h = (b-a)/N

function [v] = myQuadraturSum1D(f, w, p, a, b, N)

  
  for i = 1:1:N
    
    ### Erzeugen des kleinsten Elementes des Teilintervalles ###
    
    I = (a + (i - 1) * (b - a) / N);
    
    ### Stützstellen auf I ###
    
    x = I + p;
    
    ### Zusammengesetzte Quadratur ###
    
    v(i) = sum(w .* f(x));
    
   end
   
  v = sum(v);

end