format long


%Aufgabenteil a
function exp = myexp (x,n)
  liste=[];
  printf('In der Funktion')
  for i = 0:n
    b=x^i/factorial(i);
    liste=[liste b];
  end
  s=sum(liste)
end
%Aufgabenteil b
function exp = myexp2 (x,n)
  liste=[];
  printf('In der Funktion')
  for i = 0:n
    b=x^i/factorial(i);
    liste=[liste b];
  end
  s=1/sum(liste)
end

%Aufgabenteil c
function exp = myexp3 (x,n)
  liste=[];
  printf('In der Funktion')
  for i = 0:n
    b=(-1)^i/factorial(i);
    liste=[liste b];
  end
  s=(sum(liste))^x
end

%Durchlauf
for lauf = 0:5:35
  printf("Durchlauf Nummer")
  lauf
  myexp(-7,lauf)
  myexp2(7,lauf)
  myexp3(7,lauf)
  printf('\n')
end

%Referenzwert
exp(-7)


%Kommentare
% Die Summe ist eine Taylorreihe der exp-Funktion, um die Stelle x=0, je größer die Abweichung des eingesetzen Wertes von x=0, desto schlechter
%Ergebnis. Der Unterschied zwischen Teil a und b liegt an dem alternierenden Vorzeichen der (-7). Da bei Teilb lediglich einmal geteilt werden entstehet
% ein kleinerer Rundungsfehler
