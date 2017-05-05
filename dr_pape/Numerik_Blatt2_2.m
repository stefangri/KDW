x = single(0.8:10**(-4):1.2);

polynom = [1 -8 28 -56 70 -56 28 -8 1];

function y_P_8 = poly_8(x)
  y_P_8 = (x-1)**8;
end

function y_Horner = Horner_poly_8(x, polynom)
  buffer = 1;
  for i = 2:length(polynom)
    buffer = buffer * x + polynom(i);
  end
  y_Horner = buffer;
  %y_Horner = (((((((x-8)*x+28)*x-56)*x+70)*x-56)*x+28)*x-8)*x+1;
end

y_1 = sum(zeros(length(x)));
y_2 = sum(zeros(length(x)));

for i = 1:length(x)
  y_1(i) = poly_8(x(i));
  y_2(i) = Horner_poly_8(x(i), polynom);
end

figure
printf('Polynom in normaler Schreibweise: ')
plot(x, y_1,'r')

figure
printf('Polynom in Horner Schreibweise: ')
plot(x, y_2)


% Beobachtung: Das Horner-Schema liefert ein sehr schlechtes Resultat
% Das normale Verfahren liefert einen besseren Plot, der plausibel erscheint