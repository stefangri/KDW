function [c] = myQuadratur1D(f, w, x)
  c = sum(f(x) .* w);
end
