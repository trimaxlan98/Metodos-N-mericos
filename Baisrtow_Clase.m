%Metodo de Bairstow
clc 
clear all
r=-1;
s=-1;
a=[1 -3.5 2.75 2.125 -3.875 1.25];%polinomio
i=3;%numero de iteraciones
for j=0:i
b5=a(1);
b4=a(2)+r*b5;
b3=a(3)+r*b4 + s*b5;
b2=a(4)+ r *b3 +s*b4;
b1=a(5)+ r *b2 +s*b3;
b0=a(6)+ r *b1 +s*b2;
c5=b5;
c4=b4+r*c5;
c3=b3+r*c4+s*c5;
c2=b2+r*c3+s*c4;
c1=b1+r*c2+s*c3;
%c0=b0+r*c1+s*c2;
dr=(c3*b0-b1*c2)/(c2*c2-c1*c3);
ds=(c1*b1-c2*b0)/(c2*c2-c1*c3);
r=r+dr;
s=s+ds;
er=abs(dr/r)*100;
es=abs(ds/s)*100;  
end
x_p=(-0.5 + sqrt((r^2)+4*s))/2
x_n=(-0.5 - sqrt((r^2)+4*s))/2
%% Dividiendo tarea x^3 - 4x^2 + 5.25x -25