clc  %permite borrar el area de trabajo
clear all  %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina
xi=[153 198 270 320 355 410 460 512 562 614 664 716 766];
yi=[87.8 96.6 176 263 350 569 833 1227 1623 2105 2677 3378 4257];

A=input('Ingrese los valores de E0/a y a: ');

n=length(xi);
z0a=[];
z0b=[];
D=[];
for j=1:n
    z0a=[z0a, exp(xi(j)*A(2))-1];
    z0b=[z0b, A(1)*xi(j)*exp(xi(j)*A(2))];
    D=[D, yi(j)-A(1)*(exp(A(2)*xi(j))-1)];
end
z0=[z0a' z0b'];
ztransz=z0'*z0;
z0transD=z0'*D';
A1=A'+pinv(ztransz)*z0transD;
errorA1=abs((A1(1)-A(1))/A1(1));
errorA2=abs((A1(2)-A(2))/A1(2));
%% Grafica epsilon contra sigma 2
x=0:0.001:765;
% a=78.21;
% b=0.005266;
a=A1(1)
b=A1(2)
f=a*exp(b*x);
figure(1)
scatter(xi,yi,'linewidth',3)
ylabel('\sigma')
xlabel('\epsilon')
hold on
plot(x,f,'r','linewidth',2)
hold on
%% Ajuste 3
coeficientes = polyfit(xi,yi,2);
f=polyval(coeficientes,xi);
plot(xi,f,'k','linewidth',2)
grid on