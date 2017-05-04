x = single(0.8:10**(-4):1.2);


function P_8 = poly_8(x)
  x^8-8*x^7+28*x^6-56*x^5+70*x^4-56*x^3+28*x^2-8*x+1;
end 

function Horner = Horner_poly_8(x)
  (((((((x-8)*x+28)*x-56)*x+70)*x-56)*x+28)*x-8)*x+1;
end

y_1 = zeros(length(x))
y_2 = zeros(length(x))

for i = 1:length(x)
  y_1(i)=poly_8(x(i))
  y_2(i)=Horner_poly_8(x(i))  
end

printf('Polynom in normaler Schreibweise: ')
plot(x, y_1)

printf('Polynom in Horner Schreibweise: ')
plot(x, y_2)