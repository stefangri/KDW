function c = Parameter(K, xWert, x, y)
  if (xWert >= x(1) && xWert <= x(2))
    printf("Erste Rekursion")
    c =  (K(1)*(xWert-x(1))+y(1));
  else 
    printf("zweite Rekursion")
    c =  Parameter(K(2:end), xWert, x(2:end), y(2:end));
  end
end