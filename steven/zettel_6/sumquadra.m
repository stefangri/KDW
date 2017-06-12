function [a,b,c] = sumquadra(f ,gew, stuz, a, b, N)
  h=(b-a)/N;
  genau=2/5*atan(5);

  for n = [0: 1: N] %%Stützstellen
    x(n+1)=a+n*h;
    obere_grenze(n+1)=a+n*h;
    untere_grenze(n+1)=a-n*h;
  end

  %%%%Summierte Trapezregel
  for n = [1:1:N]
    trapez(n)=f(x(n));
    simpson(n)=f(x(n))+4*f(h*(x(n)+x(n+1)))+f(x(n+1));
  end
  a=trapez_ergebnis=abs(h*(0.5*(f(a)+f(b))+sum(trapez))-genau);
  b=simpsong_ergebnis=abs(h/6 * sum(simpson)-genau);


  %%$Summierte Simpsonregel


  %%% Summierte 3/8 Regel
  %for n= [1:1:N]
   newton(n)=f(x(n))+3*f(x(n)+h)+3*f(x(n+1)-h)+f(x(n+1));
  %end
c=newton_ergebnis= abs(h/8*sum(newton)-genau);
  %%%Quadratur Formel
  %for n = [1:1:length(stuz)]
  %  quda(n) = gew(n)*f(stuz(n));
  %end
  %c=quda_ergebnis=abs(sum(quda)-genau);
  %%%%
