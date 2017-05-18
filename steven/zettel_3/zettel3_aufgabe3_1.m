clear

x=[-1:1e-4:1]; % Definitionsbereich

for k= [7,12,17] %Um die Plotszu speichern k einzeln eingeben, sonst überlagerung vorhanden
%k=7
%%Bestimmung der Stützstellen
  aqui=[];
  tsche=[];
  for i = 0:1:k
    aqui=[aqui -1+(2*i)/k];
    tsche=[tsche cos((2*i+1)*pi/(2*k+2))];
  end

format long

%%%%%Maximumsbestimmung
maxi_aqui=[];
maxi_tsche=[];
for m=[0:1:100]
maxi_aqui=[maxi_aqui ( abs( runge(-1+((2*m)/100)) - poly(-1+((2*m)/100),aqui,runge(aqui)) ) ) ];
maxi_tsche=[maxi_tsche ( abs( runge(-1+((2*m)/100)) - poly(-1+((2*m)/100),tsche,runge(tsche)) ) ) ];
end
printf('Maximum_aequidistant')
max(maxi_aqui)
printf('\n Maximum teschebyschoff')
max(maxi_tsche)


%%%Plotbereich
figure_1=figure;
hold on
xlim([-1.0 1.0])
ylim([-4.4 1.1])
plot(x,runge(x),'g');
plot(aqui,runge(aqui),'r*');
plot(x,poly(x,aqui,runge(aqui)),'r-');
plot(x,poly(x,tsche,runge(tsche)),'b-');
plot(tsche,runge(tsche),'b*');
hold off


legend('Rungefunktion', 'Fit mit aequidistanten Stuetz', 'aequidistanten Stuetzstellen', 'Fit mit tschebyschoff Stuetz', 'tschebyschoff Stuetzstellen')
xlabel('x')
ylabel('y')
title(['Plot fuer n=' num2str(k)])
print(['plots/PA2-1-N' num2str(k) '.pdf']); %save
%plot(x,poly(x,aqui,runge(aqui)))
%plot(x,poly(x,aqui,runge(aqui)))
saveas(figure_1,['plots/PA2-1-N' num2str(k) '.fig'])

input('Return')
end % Wenn k einzeln dann auch hier auskommetieren

%Beobachtung
%Die äquidistanten Stützstellen besitzen gerade am Intervallende stärke Schwankungen als tschebyschoff.
%Jedoch nähern sich die äquidistanten der Funktion in der Mitte des Intervalls besser der eigentlichen Funktion, als
%tschebyschoff-Stützstellen.
% %
%
%
%
%
