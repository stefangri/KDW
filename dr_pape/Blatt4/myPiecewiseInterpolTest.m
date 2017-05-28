for n = [2, 4, 8, 16, 32, 64, 128]

  x = -1:0.01:1; # nahezu exaktes x Intervall
  
  i = 0:n;
  x_S_h = -1 + 2 * i / n; # erzeugen aequidistanter Stützstellen S_h
  
  m = 100;
  j = 0:m;
  x_I_h = -1 + 2 * j / m;
  
  y_1 = runge(x_I_h); # y Werte der runge fkt zu den Stützstellen
  y_2 = e(x_I_h); # y Werte der e fkt zu den Stützstellen

  y_runge = runge(x);
  y_e = e(x);


  ### lineare Interpolation
  
  lin_runge = myPiecewiseInterpol(x_S_h, y_1, x);
  lin_e = myPiecewiseInterpol(x_S_h, y_2, x);  
  
  
  
  ### Newton Interpolation
  #y_1 = sum(zeros(n));
  #y_2 = sum(zeros(n));
  #p_1 = sum(zeros(length(x)));
  #p_2 = sum(zeros(length(x)));
 
   
  c_1 = myNewtonInterpol(x_I_h, y_1);
  c_2 = myNewtonInterpol(x_I_h, y_2);
 
  for i = 1:length(x)
  
    p_1(i) = Interpol(x_I_h, c_1, x(i));
    p_2(i) = Interpol(x_I_h, c_2, x(i));
  
  end
    
  for i = 1:length(i)
  
    p_1_err(i) = abs(Interpol(x_I_h, c_1, x(i)) - runge(x(i))); 
    p_2_err(i) = abs(Interpol(x_I_h, c_2, x(i)) - e(x(i)));
  
  end
  
  max(p_1_err)
  max(p_2_err)
  ### Ende Newton
  
    fig = figure('visible', 'on');
  plot(x, y_runge, '-', 2);
  plot(x, y_e, '-', 4);
  hold on;
  plot(x, p_1, '-', 1);
  plot(x, p_2, '-', 3);
  plot(x, lin_runge, '-', 5);
  plot(x, lin_e, '-', 6);
  legend ('Exakt runge','Exakt e', 'Newton-Inter. Runge', 'Newton-Inter. exp','lin. Runge', 'lin.e', 'location', 'northeastoutside');


  title(['Interpolation mit N = ' num2str(n)]);
  xlabel('x');
  ylabel('y');
  print(['PA2-1-N' num2str(n) '.fig']);
  
  
end

  #1       red
  #2       green
  #3       blue
  #4       magenta
  #5       cyan
  #6       brown 