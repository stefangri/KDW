format long


function y = f(x)
  y = cos(2*x)^2 - x^2;
end

function y = df(x)
  y = -4 * sin(2*x) * cos(2*x) -2*x;
end





f = @f;
df = @df;


[x_newton, e_newton, v_newton] = myNewton(f, df, 0.75);

[x_bisect, e_bisect, v_bisect] = mybisect(f, 0, 0.75);

fig = figure('visible', 'off');

  semilogy([1:1:length(v_newton)], e_newton(2:end), 'g-');
  hold on;
  semilogy([1:1:length(v_bisect)], e_bisect(2:end), 'b-');


  xlabel('n');
  ylabel('e');
  print(['PA8.3.fig']);

%Der Plot zeigt, dass die Konvergenzgeschwindigkeiten mit der Theorie übereinstimmen. Das
%Bisektionsverfahren konvergiert zwar, jedoch wesentlich langsamer als das Newton-Verfahren,
%das bei geeignter Wahl des Startwertes schneller konvergiert.
