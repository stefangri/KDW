A =[8, 0 , 3; 6, -6, 1; 2, 4, 2 ]
%A = [1, 0, 0; 0, 1, 0; 0, 0, 1]
B = [1,0, 0, 1; -1, 1, 0, 1; -1, -1, 1, 1; -1, -1, -1, 1]


b = [9, 23, -4];
LR = LR_decompose(A)

y = forward_solve(LR, b);
solution = backward_solve(LR, y)
A * solution
