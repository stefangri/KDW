format long


% Approximation der Eulerschen Zahl nach der ersten Variante
function approx_e = Approx_1(x, n)
  printf('Aufgabenteil a: ')
  buffer = zeros(n);
  for i = 1:n
    buffer(i) = x^i/factorial(i); % Nach der gebenen Approximationsformel
  end
  e = sum(sum(buffer))
end

% Approximation der Eulerschen Zahl in der zweiten Variante
function approx_e_2 = Approx_2(x, n)
  printf('Aufgabenteil b: ')
  buffer = zeros(n);
  for i = 1:n
    buffer(i) = -x^i/factorial(i);
  end
  e = 1/sum(sum(buffer))
end

% Approximation der Eulerschen Zahl in der dirtten Variante
function approx_e_3 = Approx_3(x, n)
  printf('Aufgabenteil c: ')
  buffer = zeros(n);
  for i = 1:n
    buffer(i) = -1/factorial(i);
  end
  e = sum(sum(buffer))^(-x)
end

% Schleife in der alle geforderten Funktionswerte abgelaufen werden
for lauf = 5:5:35
  printf("Durchlauf Nummer")
  lauf
  Approx_1(-7,lauf)
  Approx_2(-7,lauf)
  Approx_3(-7,lauf)
  printf('\n')
end

% Vergleich mit der eulerschen Zahl

exp(-7)