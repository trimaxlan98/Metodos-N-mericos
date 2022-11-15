%% Interpolacion
clear;
clc;
close all;
x=0:0.01:8;
x0=1;
x1=4;
x2=6;
x3=8;
f= @(xf) log(xf);
aux3=(f(x3)-f(x2))/(x3-x2);

b0= f(x0);
b1=(f(x1)-b0)/(x1-x0);
aux=(f(x2)-f(x0))/(x2-x0);
b2=(aux-b1)/(x2-x1);

aux1=(f(x3)-f(x0))/(x3-x0);
aux2=(f(x2)-f(x1))/(x2-x1);

b3=(f(x3)-f(x0)-b1*(x3-x0)-b2*(x3-x0)*(x3-x1))/((x3-x0)*(x3-x1)*(x3-x2));
y= @(x) b0+b1*(x-x0)+b2.*(x-x0).*(x-x1)+b3*(x-x0).*(x-x1).*(x-x2);
a=y(2);
f2= @(xa) log(xa);
b=f2(2);
figure(1)
plot(x,y(x),'r','linewidth',2)
hold on
plot(x,f2(x),'b','linewidth',2)
grid on