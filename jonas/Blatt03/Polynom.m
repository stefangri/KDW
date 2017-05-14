function P = Polynom(x_Stuetz, y_Stuetz, x_Werte)
  a = zeros(1,length(x_Werte));
  b = myNewtonInterpol(x_Stuetz, y_Stuetz);
  
  for i = 1:length(x_Stuetz)
    a = a + b(i) * NewtonBase(x_Werte, x_Stuetz(1:i));
  end
  P = a;
end