function [c] = myPiecewiseInterpol(x, y, xEval)
  K = Koeff(x,y);
  for i = 1:length(xEval)
    c(i) = Parameter(K, xEval(i), x, y);
  end
end