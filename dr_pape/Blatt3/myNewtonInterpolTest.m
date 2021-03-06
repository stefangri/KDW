for n = [7, 12, 17]
  x_1 = sum(zeros(n)); % Erzeugen von einem Array in dem die äquidistanten Stützstellen gespeichert werden
  y_1 = sum(zeros(n));
  x_2 = sum(zeros(n)); % Erzeugen eines Arrays in dem die Tscherbyscheff-Knoten gespeichert werden
  y_2 = sum(zeros(n));
  x_exakt = -1:0.01:1;
  y_exakt = sum(zeros(n));
  N_k_1 = sum(zeros(length(x_exakt)));
  N_k_2 = sum(zeros(length(x_exakt)));
  
  for i = 1:n
    x_1(i) = -1 + 2 * (i - 1) / n; % Erzeugen äquidistanter Stützstellen
    y_1(i) = f(x_1(i));

  end
  
  for i = 1:n
    x_2(i) = cos((2 * i + 1) / (2 * n + 2)); % Formel der Tscherbyscheff-Knoten
    y_2(i) = f(x_2(i));
  
  end
  
  for i = 1:length(x_exakt)
    y_exakt(i) = f(x_exakt(i));

  end
  
  for i = 1:length(x_exakt)
    N_k_1 = Newton_Basispolynome(x_exakt(i), x_1, y_1);
    N_k_2 = Newton_Basispolynome(x_exakt(i), x_2, y_2);
  
  end
  
    
  plot(x_exakt, y_exakt, 'b-')
  hold on;
  plot(x_exakt, N_k_1, 'g-')
  hold on;
  plot(x_exakt, N_k_2, 'k-')
  hold on;
end