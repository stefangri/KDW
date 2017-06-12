

%%%%%% Aufgabe 4.1

A=[0.2, 0.5, 1, 1.5, 2,2.5; 0.04, 0.5**2, 1, 1.5**2, 4, 2.5**2];
A_t=transpose(A);
y=[2.8; 6.3; 10; 11.5; 10.3; 6.8];
A_ti=inv(A*A_t);
koe=A_ti*A*y
printf('g')
koe(2)*2
printf('\n')
printf('\n')
printf('\n')


%%%%% Aufgabe 4.2

A=[1, 0, 0; 1, (sqrt(2)/2), 1; 1 1 0; 1, -1, 0];
A_t=transpose(A);
y=[1.1; 3.9; 11.2; -9.2];
A_ti=inv(A_t*A);
koe=A_ti*A_t*y

poly=[];
for n= 1:1:length(koe)
  poly(n)=koe(n)
end

t=[0 pi/4 pi/2 (3*pi)/2];

fehler=[];
for i = 1:1:length(t)
  fehler(i)=( (koe(1)+koe(2)*sin(t(i))+koe(3)*sin(2*t(i)) ) - y(i) )**2
end
sqrt(sum(fehler))
