function [c] = quadra(f,w,x)
  printf('In der Funktion')
  len=length(w);
  for n =1:1:len
    liste(n)=w(n)*f(x(n))
  end
  c=sum(liste);
end
