#A =[4, -1, 2; -8, 7, 3; 24, -26, 13]
#A = [1, 0, 0; 0, 1, 0; 0, 0, 1]
#B = [1,0, 0, 1; -1, 1, 0, 1; -1, -1, 1, 1; -1, -1, -1, 1]


#b = [1, 2, 1];
#LR = LR_decompose(A)
#y = forward_solve(LR, b);
#x = backward_solve(LR, y)
#A * x



function LR_Test()
for n = [10:5:25]

x = transpose(((n-1):-1:0)/ n);
b(1:n/2) = 1;
b(n/2:n) = 2;

V = vander(x);
LR = LR_decompose(V);
y = forward_solve(LR, b);
solution = backward_solve(LR, y);
n
err = norm(V*x - b, 2)

end
end
