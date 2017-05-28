function [p] = myNewtonInterpol(x, y)
  p(:,1) = y;
  for l = 2:1:length(x)
    for k = 1:1:length(x) - l + 1
      p(k, l) = ( p(k + 1, l - 1) - p(k, l - 1) ) / (x(k + l-1) - x(k));
    end
  end
  p = p(1,:);
 end