function [liste] =myNewton(x,f) %x entsprechen den Stützstellen, f den Funktionswerten an den Stütztstellen
y=[;]; %2 dim Array um die Werte abzuspeichern
liste=[];
n=length(x);
  for l = 1:1:n
    for k = 1:1:n-l+1
      if l==1
        y(l,k)=f(k); %Übergagbe der Funktionswerte in die erste Zeile
      else
        y(l,k)=(y(l-1,k+1)-y(l-1,k))/(x(l+k-1)-x(k)); %Bestimmung der Koeffizienten
      end
    end
  end
  liste=y(:,1); %Es werden nur die Koeffizienten der ersten Spalte benötigt, diese werden in der Liste zwischen gespeichert und übergeben.
end
