format long
%syms k

function exp = myexp (x,n)
  liste=[];
  printf('In der Funktion')
  for i = 0:n
    b=x^i/factorial(i);
    liste=[liste b];
  end
  s=sum(liste)
end

function exp = myexp2 (x,n)
  liste=[];
  printf('In der Funktion')
  for i = 0:n
    b=x^i/factorial(i);
    liste=[liste b];
  end
  s=1/sum(liste)
end

function exp = myexp3 (x,n)
  liste=[];
  printf('In der Funktion')
  for i = 0:n
    b=(-1)^i/factorial(i);
    liste=[liste b];
  end
  s=(sum(liste))^x
end

myexp(-7,2)
for lauf = 0:5:35
  printf("Durchlauf Nummer")
  lauf
  myexp(-7,lauf)
  myexp2(7,lauf)
  myexp3(7,lauf)
  printf('\n')
end
1/exp(7)
