function [y] = poly(x_wert,stutz,f)
  divdiff=myNewton(stutz,f); %Bestimmugn der dividierten Differenzen
  n = length(stutz);
  a=[0];
  for i =[1:1:n]
    a=a+divdiff(i)*koe(stutz,i,x_wert); %Bestimmung des Newtonpolynoms
  y=a;
  end
end
