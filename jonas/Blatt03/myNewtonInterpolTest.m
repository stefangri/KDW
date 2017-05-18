for N = [7, 12, 17]
  i = 0:1:N;
  x_aequi = -1 + 1/N * 2 * i ;
  x_tsch  = cos((2*i+1)*pi/(2*N +2)); 
  x_Werte = -1:0.01:1 ;
  
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
  print(['PA2-1-N' num2str(N) '.pdf']);
  
end