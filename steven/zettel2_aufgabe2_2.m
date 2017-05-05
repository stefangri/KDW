x=single(0.8: 1e-4:1.2);

format long
pol =[1 -8 28 -56 70 -56 28 -8 1]

%not 100% functional
liste=[]
for i = x
  beta=pol(1);
  for n = 2 : size(pol)(2)
    beta=beta*i+pol(n);
  end
  liste= [liste beta];
  end
size(liste)
size(x)

%polynom(y)
%xlim manual

%hold on
figure
plot(x,(1-x).^8,'r')
figure
plot(x,liste,'b')
xlim([0.75 1.25])
%ylim([0 2.7*1e-6])
xlabel('x')
ylabel('y')
legend('(x-1)^8','hornaschema')


input('return')
