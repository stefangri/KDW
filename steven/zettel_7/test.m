format long
B_LR=[3 6; 3 -10];
test=[ 8 0 3 ; 6 -6 -1; 2 4 2 ]

LR_decompose(test)

B=forward_solve(B_LR,[1;1]);
X=backward_solve(B_LR,B)

%for n= [10 15 20 25]
n=4
  printf('Wir sind bei n= ',n)
  for i = [1:fix(n/2)]
    b(i)=1;
  end
  for i = [fix(n/2)+1:n]
  b(i)=2;
  end
  V=vander((n-1:-1:0));
LR=LR_decompose(V)

  fehler=norm(V.*backward_solve(LR, forward_solve(LR, b)), 2)
  printf('\n\n\n')
%end
