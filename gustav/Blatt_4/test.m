x = [0   1  2];
y = exp(x);
xEval = 0:0.5:2;
c = myPiecewiseInterpol(x, y, xEval)
