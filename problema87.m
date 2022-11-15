%%
clear all
clc
Pc=4600;
R=0.518;
Tc=191;
Tcelcius=-40;
T=Tcelcius+273.15;
a=0.427*R^(2)*Tc^(2.5)/Pc;
b=0.0866*R*Tc/Pc;
p=65000;
v=0:0.0001:0.005;
y=p-R*T./(v-b)+a./(v.*(v+b)*sqrt(T));
%65000-0.5180*233.15/(x-0.0019)+12.5578/(x*(x+0.0019)*sqrt(233.15))
subplot(1,2,1)
plot(v,y,'r','linewidth',1)
title('Función')
grid on
subplot(1,2,2)
plot(v,y,'r','linewidth',1)
title('Acercamiento a la raiz')
axis([0.002805 0.002814 -400 400])
grid on
%% Masa
raiz=0.002815; %Obtenida con el metodo de la biseccion
V=3;
m=V/raiz %Masa