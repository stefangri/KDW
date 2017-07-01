A =[1, 3 , -1, 2; 3, 25, 5, 10; -1, 5, 41, -18; 2, 10, -18, 18]
%A = [1, 0, 0; 0, 1, 0; 0, 0, 1]
B = [1,0, 0, 1; -1, 1, 0, 1; -1, -1, 1, 1; -1, -1, -1, 1]


b = [9, 23, -4, 1];
LR = LR_decompose(A)

y = forward_solve(LR, b);
solution = backward_solve(LR, y)
A * solution
