function [x_ruck,e,v,n]=newton(f,df,x0)
  x(1)=x0;
  for n =[1:1:51]
    m(n)=n
    x(n+ 1)=x(n)-f(x(n))/df(x(n));
    feh(n)=abs(x(n)-x(n+1));
    func(n)=f(x(n));
  end
  n=m
  x_ruck=x;
  e=feh;
  v=func;
  end
