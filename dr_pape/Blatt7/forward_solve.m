### Skript für die Vorwärtssubstitution einer LR zerlegten Matrix A mit rk(A) = n ###

function y = forward_solve(LR, b)

  ### Rang der Matrix LR ###
  n = length(sum(LR));
  ### Erstes Element des Lösungsvektors elementar berechnen ###
  y(1) = b(1);

  for i = 2:1:n
    
    y(i) = b(i) - sum(LR(i, 1:(i - 1)) .* y(1:(i - 1)));
  
  end

end