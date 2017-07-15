
function y = f(x)
  y = (x+1)/(x+3);
end

x_stern = -1 + sqrt(2)
x_1 = myFixpunktIter(@f, 0, 6)
x_2 = myFixpunktIter(@f, 1, 6)
x_3 = myFixpunktIter(@f, 10, 6)
q = 2/9;
d_1 = abs(x_1(6) - x_stern)
priori_1 = (q**5)/(1 - q) * abs(x_1(2) - x_1(1))
posteriori_1 = q/(1-q) * abs(x_1(6) - x_1(5))

d_2 = abs(x_2(6) - x_stern)
priori_2 = (q**5/(1 - q)) * abs(x_2(1) - x_2(2))
posteriori_2 = q/(1-q) * abs(x_2(6) - x_2(5))

d_3 = abs(x_3(6) - x_stern)
priori_3 = (q**5/(1 - q)) * abs(x_3(1) - x_3(2))
posteriori_3 = q/(1-q) * abs(x_3(6) - x_3(5))

q = 11/24;
for i = [1:100]
  if((q**i)/(1-q)*1/6 < 1/1000)
    i
    break
  end
end
