for n = [2, 4, 8, 16, 32, 64, 128]
  
  # nahezu exaktes x Intervall
  x = -1:0.01:1;
  
  i = 0:n;
  # erzeugen aequidistanter Stützstellen S_h
  x_S_h = -1 + 2 * i / n;
  
  m = 100;
  j = 0:m;
  # feines Raster aus Aufgabenstellung
  x_I_h = -1 + 2 * j / m;
  
  # y Werte der runge fkt zu den Stützstellen I_h
  y_1 = runge(x_S_h);
  # y Werte der e fkt zu den Stützstellen I_h
  y_2 = e(x_S_h);
  
  # y werte für die stückweise lineare Interpolation
  y_lin_runge = runge(x_S_h);
  y_lin_e = e(x_S_h);
  
  # exakte y werte
  y_runge = runge(x);
  y_e = e(x);

  ### stückweise lineare Interpolation
  
  lin_runge = myPiecewiseInterpol(x_S_h, y_lin_runge, x);
  lin_e = myPiecewiseInterpol(x_S_h, y_lin_e, x);
  
  ### Newton Interpolation
  
  # sicherstellen, dass Newton-Interpolation nur bis n = 16 ausgeführt wird
  if n <=16
  
    # Erzeugen von leeren Arrays in denen die y-Werte der Newton Interpolation gespeichert werden
    p_1 = sum(zeros(length(x)));
    p_2 = sum(zeros(length(x)));
 
    ### Newto-Interpolation ausführen:
    c_1 = myNewtonInterpol(x_S_h, y_1);
    c_2 = myNewtonInterpol(x_S_h, y_2);
 
    for i = 1:length(x)
      
      p_1(i) = Interpol(x_S_h, c_1, x(i));
      p_2(i) = Interpol(x_S_h, c_2, x(i));
  
    end
    ### Newton-Interpolation abgeschlossen. y-Werte der Funktion f_i sind in p_i gespeichert.
    
    ### Fehler berechnen
    
    for i = 1:length(x_I_h)
  
     p_1_err(i) = abs(Interpol(x_S_h, c_1, x_I_h(i)) - runge(x_I_h(i))); 
     p_2_err(i) = abs(Interpol(x_S_h, c_2, x_I_h(i)) - e(x_I_h(i)));
  
    end
    
    lin_runge_err = abs(myPiecewiseInterpol(x_S_h, y_lin_runge, x_I_h) .- runge(x_I_h));
    lin_e_err = abs(myPiecewiseInterpol(x_S_h, y_lin_e, x_I_h) .- e(x_I_h)); 
  
      
  
    ### Fehlerausgabe
    printf('Fehler Newton Runge-Fkt zum Durchlauf: ')
    n
    printf(': ')
    max(p_1_err)
    printf('Fehler newton e-Fkt. zum Durchlauf: ')
    n
    printf(': ')
    max(p_2_err)
    printf('Fehler stückweise lin. Runge zum Durchlauf: ')
    n
    printf(': ')
    max(lin_runge_err)
    printf('Fehlerstückweise lin.e:')
    n
    printf(': ')    
    max(lin_e_err)
    
    ### Ende Newton
  
    ### Plotten
    fig = figure('visible', 'on');
    plot(x, y_runge, 'g-');
    hold on;
    plot(x, p_1, 'r-');
    hold on;
    plot(x, lin_runge, 'b-');
    plot(x_S_h, y_lin_runge, 'k*')
    legend ('Runge', 'Newton-Interpol.', 'stückweise lin. Interpol.', 'Stützstellen','location', 'northeastoutside');
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
    plot(x_S_h, y_lin_e, 'k*')
    legend ('e-Fkt.', 'Newton-Interpol.', 'stückweise lin. Interpol.', 'Stützstellen','location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['e_Fkt-' num2str(n) '.fig'])
   
   ### Nur noch lineare Interpolation ab n > 16
   else
    
    ### Fehler berechnen
    
    lin_runge_err = abs(myPiecewiseInterpol(x_S_h, y_lin_runge, x_I_h) .- runge(x_I_h));
    lin_e_err = abs(myPiecewiseInterpol(x_S_h, y_lin_e, x_I_h) .- e(x_I_h)); 
  
  
    ### Fehlerausgabe
    printf('Fehler stückweise lin. Runge zum Durchlauf: ')
    n
    printf(': ')
    max(lin_runge_err)
    printf('Fehlerstückweise lin.e:')
    n
    printf(': ')    
    max(lin_e_err)
  
  
    ### Plotten
    fig = figure('visible', 'on');
    plot(x, y_runge, 'g-');
    hold on;
    plot(x, lin_runge, 'b-');
    plot(x_S_h, y_lin_runge, 'k*')
    legend ('Runge', 'stückweise lin. Interpol.', 'Stützstellen', 'location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['runge-' num2str(n) '.fig']);
  
  
    fig = figure('visible', 'on');
    plot(x, y_e, 'g-');
    hold on;
    plot(x, lin_e, 'b-');
    plot(x_S_h, y_lin_e, 'k*')
    legend ('e-Fkt.', 'stückweise lin. Interpol.', 'Stützstellen','location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['e_Fkt-' num2str(n) '.fig']);
  end
  
end


######## Beobachtungen ########

# Die Exp. Funktion wird durch die polynomielle Interpolation besser approximiert,
# als durch die lineare Interpolation. Die Newton-Interpolation konvergiert
# schneller gegen die e-Fuktion als die stückweise lineare Interpolation.
# Die polynomielle Interpolation konvergiert schneller gegen die e-Fkt.,
# als die stückweise lineare Interpolation.
# Dies liegt an der Tatsache, dass die e-Fkt dem Verlauf eines Polynomes
# ähnelt, da die e-Fkt streng monoton steigt und einen kurvenartigen Verlauf hat.
# Kurven lassen sich durch stücksweise lineare Interpolationen mit wenigen
# Stützstellen nicht gut approximieren.

# Hingegen wird die Runge Funktion besser durch die lineare Interpolation
# approximiert. Die Newton-Interpolation approximiert besonders am Rand
# schlecht. Die Wahl der äquidistanten Stützstellen führt dazu, dass das
# Ausgleichspolynom instabil ist. Die stückweise lineare Interpolation
# konvergiert in diesem Fall schneller gegen die Runge-Fkt..
# Diesmal teilt die zu interpolierende Fuktion keine Eigenschaft mit einer der beiden
# Interpolationsfunktionen. Damit ist das Newton-Verfahren nicht prädestiniert,
# wie bei der e-Funktion. In diesem Fall konvertiert die stückweise lineare
# Interpolation schneller.