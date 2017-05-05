% Erstellt für Octave
x=single(0.8:1e-4:1.2); % Erstellt Stützverktor
y_kl = (x-1).^8; % Wertet x nach der Formel (x-1)^8 aus
y_horn = (((((((x-8).*x+28).*x-56).*x+70).*x-56).*x+28).*x-8).*x+1; % Wertet x nach dem gegeben Hornerschema aus
figure % Öffnet Plotfenster
plot(x,y_kl,"c",x,y_horn,"m") % Erstellt Plots der beiden Auswertungen. Klassisch in cyan, Hornerschema in magenta.
% Es fällt auf, dass ein Großer Unterschied zwischen den beiden Auswertungen vorliegt.
% Das Hornerschema schweint fast um den "richtigen" Plot zu schwingen. Jedoch muss auch die Achsenbeschriftung beachtet werden.
% Diese läuft in 5*10^-5 Schritten.
% Die Fehler kommen daher, dass das Hornerschema anfällig für Rundungsfehler ist, und im Datentyp single gearbeitet wird. 
