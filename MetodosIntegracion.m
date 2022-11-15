%% Primera integral 
clc
clear all
tmin=[1 2 3.25 4.5 6 7 8 9 9.5 10];
tseg=60*tmin;
v=[5 6 5.5 7 8.5 8 6 7 7 5];
aux=0;
b=tseg(2);
a=tseg(1);
It=0.5*(b-a)*(v(1)+v(2));
aux=It;
b=tseg(4);
a=tseg(2);
I13=((b-a)/6)*(v(2)+4*v(3)+v(4));
aux=aux+I13;
b=tseg(5);
a=tseg(4);
It=0.5*(b-a)*(v(4)+v(5));
aux=aux+It;
b=tseg(8);
a=tseg(5);
I38=((b-a)/8)*(v(5)+3*v(6)+3*v(7)+v(8));
aux=aux+I38;
b=tseg(10);
a=tseg(8);
I13=((b-a)/6)*(v(8)+4*v(9)+v(10));
aux=aux+I13
%% Segundaintegral - Tarea