function [y] = pwinterpol(x, f, x_inter)
  y=poly(x_inter,x,f)
end
