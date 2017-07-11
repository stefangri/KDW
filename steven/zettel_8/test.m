format long
a=0;
b=0.75;
f = @(x) (cos(2*x))**2-x**2;
df= @(x) -4*cos(2*x)*sin(2*x)-2*x;

[x_ruck_int, fehl_nint, func_int, n_int]=  biscet(a,b,f);

[x_ruck_newton, fehl_newton, func_newtn, n_newton] = newton(f,df,0.75);

x_ruck_int(end)
x_ruck_newton
fehl_newton

size(n_int)
size(fehl_nint)
size(n_newton)
size(fehl_newton)


figure_1=figure;
hold on
%xlim([-1.0 1.0])
%ylim([-4.4 1.1])
semilogy(n_int(2:end),fehl_nint,'gx');
semilogy(n_newton,fehl_newton,'rx');
hold off


legend('Fehler Interball', 'Fehler Newton')
xlabel('x')
ylabel('y')

%print(['plots/PA2-1-N' num2str(k) '.pdf']); %save
input('return')
