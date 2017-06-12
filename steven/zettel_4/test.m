tic
x=[0 1 2 ];
y=exp(x);
x_inter= 0:0.05:2
pwinterpol(x,y,x_inter)

x_def= -1:1e-4:1; %Definitionsbereich
y_exp=exp(x_def); %Funktion exp
y_runge=runge(x_def); %Funktion Runge

%%Anzahl Stützstellen
zweier_potenz=[];
for i=1:7
  zweier_potenz(i)=2^(i);
end

for n = 16%zweier_potenz
    stuetz=[];
    for i = 0: n
      stuetz(i+1)=-1+(2*i)/n;
    end
    %%% Interpollierung auf dem Gesamtenbereich

    %%%%Interpolierung Exp
    figure_1=figure(1)
      %hold on
      %plot(x_def,pwinterpol(stuetz,exp(stuetz),x_def),'r')
      %plot(x_def,y_exp)
      %legend('Rungefunktion', 'Fit mit aequidistanten Stuetz', 'aequidistanten Stuetzstellen', 'Fit mit tschebyschoff Stuetz', 'tschebyschoff Stuetzstellen')
      %xlabel('x')
      %ylabel('y')
      %title(['Plot fuer n=' num2str(n)])
      %print(['plots/pdf/exp_newton_n=' num2str(n) '.pdf']); %save
      %saveas(figure_1,['plots/fig/exp_newton_n' num2str(n) '.fig'])
      %hold off

    %%%%%Interpolierung Newton
      %figure_2=figure(2)
      %hold on
      %plot(x_def,pwinterpol(stuetz,runge(stuetz),x_def),'r')
      %plot(x_def,runge(x_def))
      %title(['Plot fuer n=' num2str(n)])
      %print(['plots/pdf/runge_newton_n=' num2str(n) '.pdf']); %save
      %saveas(figure_2,['plots/fig/runge_newton_n' num2str(n) '.fig'])
      %hold off

    x_intervall=[];
    farben= ['r' 'g' 'm' 'c']

    farben_index=1
    hold on
    maxi_exp=0;
    maxi_runge=0;
    for k = 1:length(stuetz)-1
      x_intervall= stuetz(k) : 2e-2 : stuetz(k+1); %Intervall Netz
        plot(x_intervall,pwinterpol([stuetz(k) stuetz(k+1)],runge([stuetz(k) stuetz(k+1)]),x_intervall),farben(farben_index))
        plot(x_def,runge(x_def))

      farben_index+=1;
      if farben_index == length(farben)
        farben_index=1;
      end
      maxi_exp=[maxi_exp ( abs( exp(x_intervall) - pwinterpol([stuetz(k) stuetz(k+1)],exp([stuetz(k) stuetz(k+1)]),x_intervall) ) )  ]
      maxi_runge=[maxi_runge ( abs(runge(x_intervall) - pwinterpol([stuetz(k) stuetz(k+1)],runge([stuetz(k) stuetz(k+1)]),x_intervall) ) ) ]
    end
    printf('Maxima')
    max(maxi_exp)
    max(maxi_runge)
      printf('\n')

    hold off
    input('Return')



%input('Return')
end
