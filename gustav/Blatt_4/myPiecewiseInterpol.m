function [yEval] = myPiecewiseInterpol(x, f, xEval)
  yEval = zeros(1, length(xEval));
  
  for x_i = 1:1:length(xEval) %FÜR ALLE x IN xEVAL
    yEval(x_i) = sum(yEval(x_i) + f .* hut(x, xEval(x_i)));
  end
end
