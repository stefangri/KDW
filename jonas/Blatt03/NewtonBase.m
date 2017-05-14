function [N] = NewtonBase(x_Wert, x_Stuetz)
%N(1) = 1;
  for i = 1:length(x_Wert)
    N(i) = prod(x_Wert(i) - x_Stuetz(1:end - 1));
  end
end 
    

