tic
format long

f = @(x) 1/(1+25*x^2); %%% Runge Funktion

[a,b,c]=sumquadra(f,2,3,-1,1,4)
hold on
for i = [1:1:1000]
[a,b,c]=sumquadra(f,2,3,-1,1,i);
plot(i,[a],'r*')
plot(i,[b],'b*')
plot(i,[c],'y*')
%printf('\n')
end
set(gca,'yscale','log')
grid on
legend('Trapez',  'Simpson', '3/8 Regel')
input('Return')
hold off

toc
