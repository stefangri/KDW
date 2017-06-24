### Skript zu Rückwätssubstitution einer LR zerlegten Matrix A mit rk(A) = n ###

function x = backwars_solve(LR, y)

   ### Rang der Matrix LR ###
  n = length(sum(LR));
  ### Erstes Element von x elementar berechnen damit die Weiteren
  ### über eine Schleife bestimmt werde können ###
  x(n) = y(n) / LR(n ,n);
  
  
  ### Schleife zur Berechnung der übrigen Elemente des Lösungsvektors x ###
  for i = 2:1:n
    
    j = n - i + 1;
    x(j) = (y(j) - sum(LR(j, (j + 1):n) .* x((j + 1):n))) ./ LR(j, j);
  
  end

end