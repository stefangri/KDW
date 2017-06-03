### Skript für numerische Integration ###

function [c] = myQuadratur1D(f, w, x)

### Formel zur numerischen Integration ###

  c = sum(w .* f(x));
  
end  