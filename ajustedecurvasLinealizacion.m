%% Ajuste de curvas
clear all; clc; close all;
%% Logaritmo natural
x=[5 10 15 20 25 30 35 40 45 50];
X=sum(x(:));
X2=sum(x(:).^2);
y=[17 24 31 33 37 37 40 40 41 42];
yinversa=log(y(:));
Y=sum(yinversa(:));
Y2=sum(yinversa(:).^2);
XY=sum(x(:).*yinversa(:));

n=length(x);
m=(n*XY-X*Y)/(n*X2-X^2);
b=(1/n)*(Y-m*X);
e=Y-m*X-b;
e2=e^2;
r=(n*XY-X*Y)/((sqrt(n*X2-X^2))*sqrt(n*Y2-Y^2));
r2=r^2;
%presicion
p=r2*100; %medido en porcentaje
% grafica
x1=0:0.01:50;
y1=exp(b)*exp(m*x1);
figure(1)
subplot(1,4,1)
scatter(x,y,'r','linewidth',2)
hold on
plot(x1,y1,'linewidth',2)
title(['Presición ',num2str(p)])
grid on
%% Logaritmo base 10 
x=[5 10 15 20 25 30 35 40 45 50];
xinversa=log10(x(:));
X=sum(xinversa(:));
X2=sum(xinversa(:).^2);
y=[17 24 31 33 37 37 40 40 41 42];
yinversa=log10(y(:));
Y=sum(yinversa(:));
Y2=sum(yinversa(:).^2);
XY=sum(xinversa(:).*yinversa(:));

n=length(x);
m=(n*XY-X*Y)/(n*X2-X^2);
b=(1/n)*(Y-m*X);
e=Y-m*X-b;
e2=e^2;
r=(n*XY-X*Y)/((sqrt(n*X2-X^2))*sqrt(n*Y2-Y^2));
r2=r^2;
%presicion
p=r2*100; %medido en porcentaje
% grafica
x1=0:0.01:50;
y1=(10^b)*x1.^m;
figure(1)
subplot(1,4,2)
scatter(x,y,'r','linewidth',2)
hold on
plot(x1,y1,'linewidth',2)
title(['Presición ',num2str(p)])
grid on
%% Racionalizado
x=[5 10 15 20 25 30 35 40 45 50];
xinversa=1./x(:);
X=sum(xinversa(:));
X2=sum(xinversa(:).^2);
y=[17 24 31 33 37 37 40 40 41 42];
yinversa=1./y(:);
Y=sum(yinversa(:));
Y2=sum(yinversa(:).^2);
XY=sum(xinversa(:).*yinversa(:));

n=length(x);
m=(n*XY-X*Y)/(n*X2-X^2);
b=(1/n)*(Y-m*X);
e=Y-m*X-b;
e2=e^2;
r=(n*XY-X*Y)/((sqrt(n*X2-X^2))*sqrt(n*Y2-Y^2));
r2=r^2;
%presicion
p=r2*100; %medido en porcentaje
% grafica
x1=0:0.01:50;
y1=(1/b)*(x1./((m/b)+x1));
figure(1)
subplot(1,4,3)
scatter(x,y,'r','linewidth',2)
hold on
plot(x1,y1,'linewidth',2)
title(['Presición ',num2str(p)])
grid on
%% Polinomio grado 2
x=[5 10 15 20 25 30 35 40 45 50];
y=[17 24 31 33 37 37 40 40 41 42];
xi=sum(x(:));
xi2=sum(x(:).^2);
xi3=sum(x(:).^3);
xi4=sum(x(:).^4);
yi=sum(y(:));
xiyi=sum(x(:).*y(:));
xi2yi=sum((x(:).^2).*y(:));
N=length(x);
n=sum(1:N);
M=[xi4 xi3 xi2 xi2yi ; xi3 xi2 xi xiyi ; xi2 xi n yi];
R=rref(M);
a2=R(1,4);
a1=R(2,4);
a0=R(3,4);

ypromedio=sum(y(:))/n;
primera_suma=sum((y(:)-ypromedio).^2);
segunda_suma=sum((y(:)-a0-a1*x(:)-a2*x(:).^2).^2);
r2=(primera_suma-segunda_suma)/primera_suma;
%presición 
p=r2*100;
%Grafica
x1=0:0.01:50;
y1=a2*(x1.^2)+a1*x1+a0;

a11=-0.0161;
a22=1.3779;
a00=11.7667;
%y1=a22*(x1.^2)+a11*x1+a00;
figure(1)
subplot(1,4,4)
scatter(x,y,'r','linewidth',2)
hold on
plot(x1,y1,'linewidth',2)
title(['Presición ',num2str(p)])
grid on