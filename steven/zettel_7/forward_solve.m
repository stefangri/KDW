function y_vec = forward_solve(LR,b)
  n=length(LR);
help_list=0;
  for j=1:n
    if j!=1
    for k=1:j-1
      help_list(k)= LR(j,k)*y(k);
    end
    end
    y(j)=b(j)-sum(help_list);
  end
y_vec=y;
