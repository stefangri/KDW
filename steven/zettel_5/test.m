clear
format long
x=[0.5 1.5 1]
w=[1/6 4/6 1/6]

quadra(@(p)myexp(p),w,x)
1/6*(exp(1)+4*exp(3)+exp(1))
