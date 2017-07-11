function [x,e,v,n]=biscet(a,b,f)

I=[a b]
for n=[1:1:1000000]

  m(n)=n
  fehl(1)=0
    x(n)=0.5*( I(1)+I(2))

    if f(I(1))*f(x(n))<0
      printf('erste if')
      I=[I(1) x(n)];

    elseif f(I(2))*f(x(n))<0
      printf('zweite if')
      I=[x(n) I(2)];

    else
      printf('Nullstelle gefunden ')
      x
      break
    end
  if n>=2
    fehl(n)=abs(x(n)-x(n-1));
  end
  func(n)=f(x(n));
  end
n=m
x=x;
e=fehl;
v=func;
end
