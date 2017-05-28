 for n = [7, 12, 17]
 
  x_1 = sum(zeros(n)); % Erzeugen von einem Array in dem die äquidistanten Stützstellen gespeichert werden
  y_1 = sum(zeros(n));
  x_2 = sum(zeros(n)); % Erzeugen eines Arrays in dem die Tscherbyscheff-Knoten gespeichert werden
  y_2 = sum(zeros(n));
  x = -1:0.01:1;
  p_1 = sum(zeros(length(x)));
  p_2 = sum(zeros(length(x)));
 
   for i = 1:n
    
    x_1(i) = -1 + 2 * (i - 1) / n; % Erzeugen äquidistanter Stützstellen
    y_1(i) = f(x_1(i));

   end
 
   for i = 1:n
    
    x_2(i) = cos((2 * i + 1) * pi / (2 * n + 2)); % Formel der Tscherbyscheff-Knoten
    y_2(i) = f(x_2(i));
  
   end
  
  for i = 1:length(x)
    
    y(i) = f(x(i));

  end
 
  c_1 = myNewtonInterpol(x_1, y_1);
  c_2 = myNewtonInterpol(x_2, y_2);
 
  for i = 1:length(x)
  
    p_1(i) = Interpol(x_1, c_1, x(i));
  
  end
 
 
  for i = 1:length(x)
  
    p_2(i) = Interpol(x_2, c_2, x(i));
  
  end
 
  fig = figure('visible', 'on');
  plot(x, y, 'g-' );
  hold on;
  plot(x_1, y_1, 'r*');
  plot(x, p_1, 'r-');

  plot(x_2, y_2, 'b*')
  plot(x, p_2, 'b-');
  legend ('Exakt','Aequidistante Stuetzstellen', 'Interpolation','Tschebyscheff Stuetzstellen', 'Interpolation', 'location', 'northeastoutside');


  title(['Interpolation mit N = ' num2str(n)]);
  xlabel('x');
  ylabel('y');
  print(['PA2-1-N' num2str(n) '.fig']);
  
  for j = 0:100
  
    delta(j + 1) = -1 + 2 * j / 100;
  
  end
  
  for i = 1:length(delta)
  
    p_1_err(i) = abs(Interpol(x_1, c_1, delta(i)) - f(delta(i))); 
    p_2_err(i) = abs(Interpol(x_2, c_2, delta(i)) - f(delta(i)));
  
  end
  
  max(p_1_err)
  max(p_2_err)
  
  
 end