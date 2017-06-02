function [yEval] = myPiecewiseInterpol(x, f, xEval)
  for x_i = 1:1:length(xEval) %FÜR ALLE x IN xEVAL

    %SUMME ÜBER ANZAHL DER STÜTZSTELLEN 
    yEval(x_i) = sum(f.* hut(x, xEval(x_i)));
  end
end
