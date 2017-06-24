### Skript zur LR-Zerlegung einer quadratischen Matrix A mit Rang n ###

function LR = LR_decompose(A)
  
  n = length(sum(A)) - 1;
  LR = A;
  
  for j = 1:1:n
    for i = j:1:n
    
      ### Speichern der Rechenoperation ###
      
      L_Element = LR(i + 1, j) ./ LR(j, j);
      
      ### Berechnen der Elemente der R-Matrix ###
      
      g = n + 1;
      LR(i + 1, j:g) = LR(i + 1, j:g) - LR(j, j:g) ./ LR(j, j) .* LR(i + 1, j);
      R(i + 1, j:g) = LR(i + 1, j:g) - LR(j, j:g) ./ LR(j, j) .* LR(i + 1, j);
      
      ### Berechnen der Elemente der L-Matrix ###
      LR(i + 1, j) = L_Element;
      L(i + 1, j) = L_Element;
      
    end
  end
  L
  R
  
end