function LR= LR_decompose(A)

    n=length(A)

    for k =1:n
      for i = 1+k:n
        A(i,k)=A(i,k)/A(k,k);
      end
      for j = k+1:n
          for i= k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
          end
      end
    LR=A;
    end
