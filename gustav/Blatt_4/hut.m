function [phi] = hut(x_stuetz, x)

  %SONDERBEHANDLUNG FÜR ERSTE UND LETZTE STÜTZSTELLE
  if x >= x_stuetz(1) && x <= x_stuetz(2) %WENN x IM INTERVALL I_1
    phi(1) = (x_stuetz(2) - x)/(x_stuetz(2) - x_stuetz(1));

  else
    phi(1) = 0;

  end


  if x >= x_stuetz(end - 1) && x <= x_stuetz(end) %WENN x IM INTERVALL I_end
    phi(length(x_stuetz)) =(x - x_stuetz(end - 1))/(x_stuetz(end) - x_stuetz(end - 1));

  else
    phi(length(x_stuetz)) = 0;

  end


  %GEWÖHNLICHE BEHANDLUNG
  for i = 2:1:length(x_stuetz)-1

    if x >= x_stuetz(i - 1) && x <= x_stuetz(i) %WENN x IM INTERVALL I_i
      phi(i) = (x - x_stuetz(i - 1))/(x_stuetz(i) - x_stuetz(i - 1));

    else if x >= x_stuetz(i) && x <= x_stuetz(i + 1) %WENN x IM INTERVALL I_(i+1)
      phi(i) = (x_stuetz(i + 1) - x)/(x_stuetz(i + 1) - x_stuetz(i));

    else
      phi(i) = 0;

    end
  end


end
