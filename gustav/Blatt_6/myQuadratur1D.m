function [c] = myQuadratur1D(f, w, x, a, b, n)

  for i  = [1:1:length(x)]
    %ENTHÄLT ALLE STÜTZSTELLEN
    x_buffer(:,i)= a + (n - 1).* (x(end) - x(1)) +  x(i);
  end
  c = sum(f(x_buffer) .* w);
end
