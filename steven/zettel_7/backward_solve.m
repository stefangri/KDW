function x_vec= backward_solve(LR,y)
  n=length(LR);
  help_list=0;
  for i = n:-1:1
    if i!= n
      for k=i+1: n
        help_list(k)=LR(i,k)*x(k);
      end
    end
    x(i)=(y(i)-sum(help_list))/LR(i,i);
end
x_vec=x;
