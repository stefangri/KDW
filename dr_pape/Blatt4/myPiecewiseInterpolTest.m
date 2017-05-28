for n = [2, 4, 8, 16, 32, 64, 128]
#for n = [3, 9, 27]

  x = -1:0.01:1; # nahezu exaktes x Intervall
  
  i = 0:n;
  x_S_h = -1 + 2 * i / n; # erzeugen aequidistanter Stützstellen S_h
  
  m = 100;
  j = 0:m;
  x_I_h = -1 + 2 * j / m;
  
  y_1 = runge(x_I_h); # y Werte der runge fkt zu den Stützstellen
  y_2 = e(x_I_h); # y Werte der e fkt zu den Stützstellen

  y_lin_runge = runge(x_S_h); # y werte für die stückweise lineare Interpolation
  y_lin_e = e(x_S_h);
  
  y_runge = runge(x); # exakte y werte
  y_e = e(x);

  ### stückweise lineare Interpolation
  
  lin_runge = myPiecewiseInterpol(x_S_h, y_lin_runge, x);
  lin_e = myPiecewiseInterpol(x_S_h, y_lin_e, x);
  
  ### Newton Interpolation
  if n <=16
    p_1 = sum(zeros(length(x)));
    p_2 = sum(zeros(length(x)));
 
    c_1 = myNewtonInterpol(x_I_h, y_1);
    c_2 = myNewtonInterpol(x_I_h, y_2);
 
    for i = 1:length(x)
  
      p_1(i) = Interpol(x_I_h, c_1, x(i));
      p_2(i) = Interpol(x_I_h, c_2, x(i));
  
    end
    
    ## Fehler
    printf('Fehler', '\n')
    max(abs(p_1 .- runge(x)))
    max(abs(p_2 .- e(x)))
    max(abs(lin_runge .- runge(x)))
    max(abs(lin_e .-runge(x)))
    
    ### Ende Newton
  
    fig = figure('visible', 'on');
    plot(x, y_runge, 'g-');
    hold on;
    plot(x, p_1, 'r-');
    hold on;
    plot(x, lin_runge, 'b-');
    plot(x_S_h, y_lin_runge, 'b*')
    legend ('Runge', 'Newton Runge', 'lin. runge', 'location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['runge-' num2str(n) '.fig']);
  
    
    fig = figure('visible', 'on');
    plot(x, y_e, 'g-');
    hold on;
    plot(x, p_2, 'r-');
    hold on;
    plot(x, lin_e, 'b-');
    plot(x_S_h, y_lin_e, 'b*')
    legend ('e-Fkt.', 'Newton e', 'lin. e', 'location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['e_Fkt-' num2str(n) '.fig'])
  else
    
    ## Fehler
    printf('Fehler', '\n')
    max(abs(lin_runge .- runge(x)))
    max(abs(lin_e .-runge(x)))
  
    fig = figure('visible', 'on');
    plot(x, y_runge, 'g-');
    hold on;
    plot(x, lin_runge, 'b-');
    plot(x_S_h, y_lin_runge, 'b*')
    legend ('Runge', 'lin. runge', 'location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['runge-' num2str(n) '.fig']);
  
  
    fig = figure('visible', 'on');
    plot(x, y_e, 'g-');
    hold on;
    plot(x, lin_e, 'b-');
    plot(x_S_h, y_lin_e, 'b*')
    legend ('e-Fkt.', 'lin. e', 'location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['e_Fkt-' num2str(n) '.fig']);
  end
  
end



  #1       red
  #2       green
  #3       blue
  #4       magenta
  #5       cyan
  #6       brown 