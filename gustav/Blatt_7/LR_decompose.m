function LR = LR_decompose(A)

n = length(A);

for k = [1:1:n]
  A(k+1:n , k) = A(k+1:n, k) / A(k, k);
  A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - (A(k+1:n , k)* A(k, k+1:n));
end
LR = A;

end
