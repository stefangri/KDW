for n = [7, 12, 17]
  x_1 = sum(zeros(n));
  y_1 = sum(zeros(n));
  for i = 1:n

    x_1(i) = -1 + 2 * (i - 1) / n;
    y_1(i) = f(x_1(i));

  end
  myNewtonInterpol(x_1, y_1);
end
