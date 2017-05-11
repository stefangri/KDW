format long

function i = Fak(A)
  i=1; for l=1:A;
  i = i*l;
  end
end

N = [5:5:35]

function i = summe(A, x)
  i=0; for l=0:A;
  i += x^l/Fak(l);
  end
end

function i = Aufruf(x, B)
  i=0; for l=1:length(B);
  printf("Anzahl an Iterationsschritten: ")
  B(l)
  summe(B(l), x)
  1/summe(B(l), -x)
  summe(B(l), -1)^(-x)
  printf("\n")
  end
end

Aufruf(-7, N)

printf("Vergleichswert mit exp(-7) ")
exp(-7)

%Es fällt auf, dass bei den verschiedenen Berechnngsmethoden eine unterschiedlich
%lange Anzahl an Iterationen notwendig ist, um die Exponentialfunktion ordentlich
%zu approximieren. Dies liegt vermutlich an den verschiedenen Rechnungsmethoden,
%zum Beispiel werden bei der ersten Methode Terme mit verschiedenen Vorzeichen 
%addiert, die anfangs auch noch ziemlich groß sind. Am besten funktioniert hat 
%die dritte Methode, bei der schon nach 10 Iterationen der Wert auf vier Nach-
%kommastellen mit dem Vergleichswert übereinstimmt. Das kann auch daran liegen,
%dass die verwendete summe die Taylorformel beinhält, und der Wert -1 deutlich
%näher liegt als -7, bei der also der Fehler deutlich größer ist umso geringer die 
%Ordnung ist.



 