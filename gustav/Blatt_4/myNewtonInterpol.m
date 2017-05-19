function [c] = myNewtonInterpol(x, f)
  %Algorithmus zur Berechnung der Koeffizienten
  c(:,1) = f;
  for l = 2:1:length(x)
    for k = 1:1:length(x) - l + 1
      c(k, l) = ( c(k + 1, l - 1) - c(k, l - 1) ) / (x(k + l-1) - x(k)  );
    end
  end
  c = c(1,:);
end
