function LR_Test()

  %TEST FÜR N 0 5, 10, ..., 25
  for n = [10:5:25]

    %STUETZSTELLEN
    x = transpose(((n-1):-1:0)/ n);

    %B = [1, 1..., 2, 2..., 2]
    b(1: floor(n/2)) = 1;
    b(ceil(n/2):n) = 2;

    %VANDERMONDE-MATRIX
    V = vander(x);

    %AUFRUF DER METHODE ZU BESTIMMUNG DER LR ZERLEGUNG
    LR = LR_decompose(V);

    %LÖSUNG DER GLEICHUNG RY = B
    y = forward_solve(LR, b);

    %LÖSUNG DER GLEICHUNG LX = Y
    solution = backward_solve(LR, y)
    n
    % AUSGABE DES FEHLERS
    err = norm(V*x - b, 2)
    %R = sqrt(sum ((V .* x .- b).**2) )

  end

end
