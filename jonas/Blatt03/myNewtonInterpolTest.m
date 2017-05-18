for N = [7, 12, 17]
  i = 0:1:N;
  x_aequi = -1 + 1/N * 2 * i ;
  x_tsch  = cos((2*i+1)*pi/(2*N +2)); 
  x_Werte = -1:0.01:1 ;
  
  #M1 = zeros(1, 101);
  #M2 = zeros(1, 101);
  
  #for i = 1:1:101
   # d = -1 + 2* (i-1)/100;
   # M1(i) = abs(Runge(d) - Polynom(x_aequi, y_aequi, d));
   # M2(i) = abs(Runge(d) - Polynom(x_tsch,  y_tsch,  d));
  #end
  
  #Die obige Methode zu Berechnung des maximalen Fehler funktioniert für N = /
  #problemlos. Allerdings kompiliert er nicht, da es wohl Probleme mit den Polynomen
  #für N = 12, 17 gibt. Allerdings treten keine Probleme bei der Berechnung der
  #Polynome zum Plotten. Da wir nicht den Fehler gefunden haben, haben wir
  #den Teil auskommentiert. 
   
   
  #printf("Fehler aequidistante", '\n')
  #max(M1)
  #printf("Fehler Tschebyscheff", '\n')
  #max(M2)
  
  y_Runge = Runge(x_Werte);
  y_aequi = Runge(x_aequi);
  y_tsch  = Runge(x_tsch);
  
  fig = figure();
  plot(x_Werte, y_Runge, 'g-');
  hold on;
  plot(x_Werte, Polynom(x_aequi, y_aequi, x_Werte), 'r-');
  plot(x_Werte, Polynom(x_tsch,  y_tsch,  x_Werte), 'b-');
  plot(x_tsch, y_tsch, 'b*');
  plot(x_aequi, y_aequi, 'r*');
  legend('Exakte Interpolation', 'Aequidistante Interpolation',
         'Tschebyscheff Interpolation',
         'Tschebyscheff Stuetzstellen', 'Aequidistante Stuetzstellen')

  title(['Genauigkeit der Interpolation: N = ' num2str(N)]);
  xlabel('x');
  ylabel('f(x)');
   
  set(fig, "visible", "on");
  print(['PA2-1-N' num2str(N) '.fig']);
  
end