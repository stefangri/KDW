function [N] = koe(x,index,x_wert)
  len_x=length(x);
  N=1;
    if index ==1
      N(1)=1;
    else
      for j=1:1:index-1
        N=N.*(x_wert-x(j)); %Bestimmung der Vorfaktoren N
      end
    end
end
