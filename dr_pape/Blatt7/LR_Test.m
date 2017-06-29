### Skript zum Testen der LR-Zerlegung und der Vorwärts- und
### Rückwärtssubstitution

function LR_Test()

  ### Durchlauf mit verschiedenen Rängen der Matrix V ###
  for n = 10:5:25
    
    printf('rk(V): ')
    n
    ### Berechnung der Stützstellen der Vandermodnde-Matrix und der Vandermonde-Matrix ###
    ### Befehle enstammen dem Übungsblatt 7 ###
    
    x = ((n - 1):-1:0) / n;
    V = vander(x);
    
    ### Berechnung der rechnten Seite ###
    
    if (n / 2  - floor(n / 2)) == 0;
    
      b = transpose([ones(1, n / 2 - 1), ones(1, n / 2 + 1) + 1]);
    
    else
    
      b = transpose([ones(1, floor(n / 2)), ones(1, ceil(n / 2)) + 1]);  
    
    end
    
    ### Testen der Sktipte zur LR-Zerlegung ###
    ### Lösen von L * R * x = L * y = b ###
    
    LR = LR_decompose(V);
    y  = forward_solve(LR, b);
    printf('Lösungsvektor: ')
    x  = transpose(backward_solve(LR, y))
        
    ### Residuum ###
    
    Residuum = sqrt(sum(abs(V * x - b).**2))
    
  end
  
end