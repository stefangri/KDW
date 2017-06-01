### Skript zur stueckweisen linearen und polynomiellen Interpolation der
### Runge- Funktion und der Exponentialfunktion.
### Die Interpolationsverfahren werden anhand des absoluten Fehlers miteinander
### verglichen.

tic
for n = [2, 4, 8, 16, 32, 64, 128]
  
  # nahezu exaktes x Intervall
  x = -1:0.01:1;
  
  i = 0:n;
  # erzeugen aequidistanter Stuetzstellen S_h
  x_S_h = -1 + 2 * i / n;
  
  m = 100;
  j = 0:m;
  # feines Raster aus Aufgabenstellung
  x_I_h = -1 + 2 * j / m;
  
  # y Werte der runge fkt zu den Stuetzstellen I_h
  y_1 = runge(x_S_h);
  # y Werte der e fkt zu den Stuetzstellen I_h
  y_2 = e(x_S_h);
  
  # y werte fuer die stueckweise lineare Interpolation der Runge- und der e-Fkt.
  y_lin_runge = runge(x_S_h);
  y_lin_e = e(x_S_h);
  
  # exakte y werte
  y_runge = runge(x);
  y_e = e(x);

  ### stueckweise lineare Interpolation der Runge- und der e-Funktion
  
  lin_runge = myPiecewiseInterpol(x_S_h, y_lin_runge, x);
  lin_e = myPiecewiseInterpol(x_S_h, y_lin_e, x);
  
  ### Newton Interpolation
  
  # sicherstellen, dass Newton-Interpolation nur bis n = 16 ausgefuehrt wird
  if n <=16
  
    # Erzeugen von leeren Arrays in denen die y-Werte der Newton Interpolation gespeichert werden
    p_1 = sum(zeros(length(x)));
    p_2 = sum(zeros(length(x)));
 
    ### Newto-Interpolation ausfuehren:
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
    printf('Fehler polynomielle Interpolation Runge-Fkt zum Durchlauf: ')
    n
    printf(': ')
    max(p_1_err)
    printf('Fehler polynomielle Interpolation e-Fkt. zum Durchlauf: ')
    n
    printf(': ')
    max(p_2_err)
    printf('Fehler stueckweise lin. Interpolation Runge-Fkt. zum Durchlauf: ')
    n
    printf(': ')
    max(lin_runge_err)
    printf('Fehler stueckweise lin. Interpolation e-Fkt:')
    n
    printf(': ')    
    max(lin_e_err)
    
    ### Ende Newton Interpolation
  
    ### Plotten
    fig = figure('visible', 'off');
    plot(x, y_runge, 'g-');
    hold on;
    plot(x, p_1, 'r-');
    hold on;
    plot(x, lin_runge, 'b-');
    plot(x_S_h, y_lin_runge, 'k*')
    legend ('Runge', 'Newton-Interpol.', 'stueckweise lin. Interpol.', 'Stuetzstellen','location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['runge-N-' num2str(n) '.pdf']);  ## Speichern der Plots
  
    
    fig = figure('visible', 'off');
    plot(x, y_e, 'g-');
    hold on;
    plot(x, p_2, 'r-');
    hold on;
    plot(x, lin_e, 'b-');
    plot(x_S_h, y_lin_e, 'k*')
    legend ('e-Fkt.', 'Newton-Interpol.', 'stueckweise lin. Interpol.', 'Stuetzstellen','location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['e_Fkt-N-' num2str(n) '.pdf']) ## Speichern der Plots
   
   ### Nur noch lineare Interpolation ab n > 16
   else
    
    ### Fehler berechnen
    
    lin_runge_err = abs(myPiecewiseInterpol(x_S_h, y_lin_runge, x_I_h) .- runge(x_I_h));
    lin_e_err = abs(myPiecewiseInterpol(x_S_h, y_lin_e, x_I_h) .- e(x_I_h)); 
  
  
    ### Fehlerausgabe
    printf('Fehler stueckweise lin. Interpolation Runge-Fkt. zum Durchlauf: ')
    n
    printf(': ')
    max(lin_runge_err)
    printf('Fehler stueckweise lin. Interpolation e-Fkt.:')
    n
    printf(': ')    
    max(lin_e_err)
  
  
    ### Plotten
    fig = figure('visible', 'off');
    plot(x, y_runge, 'g-');
    hold on;
    plot(x, lin_runge, 'b-');
    plot(x_S_h, y_lin_runge, 'k*')
    legend ('Runge', 'stueckweise lin. Interpol.', 'Stuetzstellen', 'location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['runge-N-' num2str(n) '.pdf']); ## Speichern der Plots
    
  
    fig = figure('visible', 'off');
    plot(x, y_e, 'g-');
    hold on;
    plot(x, lin_e, 'b-');
    plot(x_S_h, y_lin_e, 'k*')
    legend ('e-Fkt.', 'stueckweise lin. Interpol.', 'Stuetzstellen','location', 'northeastoutside');
    title(['Interpolation mit N = ' num2str(n)]);
    xlabel('x');
    ylabel('y');
    print(['e_Fkt-N-' num2str(n) '.pdf']); ## Speichern der Plots
  end
  
end

toc
######## Beobachtungen ########

# Die Exp. Funktion wird durch die polynomielle Interpolation besser approximiert,
# als durch die stueckweise lineare Interpolation. Die Newton-Interpolation konvergiert
# schneller gegen die e-Fuktion als die stueckweise lineare Interpolation.
# Dies liegt an der Tatsache, dass die e-Fkt. dem Verlauf eines Polynomes
# ähnelt, da die e-Fkt streng monoton steigt und einen kurvenartigen Verlauf hat.
# Kurven lassen sich durch stuecksweise lineare Interpolationen mit wenigen
# Stuetzstellen nicht gut approximieren. Bei einer geringen Anzahl an Stuetzstellen
# ist daher die polynominelle Interpolation für streng monotone Fkt. zu bevorzugen.

# Hingegen wird die Runge Funktion besser durch die lineare Interpolation
# approximiert. Die Newton-Interpolation approximiert besonders am Rand
# schlecht. Die Wahl der äquidistanten Stuetzstellen fuehrt dazu, dass das
# Ausgleichspolynom instabil ist. Die stueckweise lineare Interpolation
# konvergiert in diesem Fall schneller gegen die Runge-Fkt..
# Diesmal teilt die zu interpolierende Fuktion keine Eigenschaft mit einer der beiden
# Interpolationsfunktionen. Damit ist das Newton-Verfahren nicht prädestiniert,
# wie bei der e-Funktion. In diesem Fall konvertiert die stueckweise lineare
# Interpolation schneller gegen die Runge-Funktion.