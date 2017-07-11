function[c] = sumquadra(f ,w, p, a, b, N)
  h=(b-a)/N; %Bestimmung h

for n = [1:1:N]

    %Bestimmung der Inteervallgrenzen
    a_neu=a+(n-1)*h; %a_neu
    b_neu=a+n*h;  %b_neu

    for i = [1:1:length(p)] %Berechnung im Intervall n
      x_neu=  ((b_neu-a_neu) / 2) * p(i) + (b_neu+a_neu) / 2;  %Bestimmung der Stützstellen
      w_neu=((b_neu-a_neu) /2 )*w(i); % Bestimmung der Gewichte
      integral_int(i)=  w_neu*f(x_neu); %BErechnung der einzelenn Summanden
    end
    integral_ges(n)=sum(integral_int); %%  Auswertung für jedes Intervall
end
c=sum(integral_ges); %Gesamt Auswertung
