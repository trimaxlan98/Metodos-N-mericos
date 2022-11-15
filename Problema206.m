%% problema 20.16
clc
clear all
close all
%% datos 1
sg=[87.8 96.6 176 263 351 571 834 1229 1624 2107 2678 3380 4258];
e=[153 204 255 306 357 408 459 510 561 612 663 714 765];
n=length(sg);
d=zeros(1,n);
for i=1:n
    if(i<n)
        d(i)=(sg(i+1)-sg(i))/(e(i+1)-e(i));
    else
        d(i)=(sg(i-1)-sg(i))/(e(i-1)-e(i));
    end
end
d
figure(1)
scatter(sg,d,'linewidth',3)
grid on
%% Grafica epsilon contra sigma
coeficientes = polyfit(e,sg,2);
f=polyval(coeficientes,e);
figure(2)
scatter(e,f,'linewidth',3)
ylabel('\sigma')
xlabel('\epsilon')
hold on
plot(e,f,'k','linewidth',2)
grid on
%% Grafica epsilon contra sigma 2
x=0:0.001:765;
a=78.21;
b=0.005266;
f=a*exp(b*x);
figure(3)
scatter(e,sg,'linewidth',3)
ylabel('\sigma')
xlabel('\epsilon')
hold on
plot(x,f,'r','linewidth',2)
grid on
%% Ajuste de curvas forma 1
x=[351 571 1229 1624 2107 2678 3380];
y=[4.3137 5.1569 7.7451 9.4706 11.1961 13.7647 17.2157];
coeficientes = polyfit(x,y,2);
f=polyval(coeficientes,x);
figure(4)
scatter(x,y,'r','linewidth',2)
hold on
plot(x,f,'k','linewidth',2)
grid on
%% Ajuste de curvas forma 2
a=0.004203;
E0=2.669;
x1=0:0.001:3500;
sigma=x1;
derivada=a.*sigma+E0;
figure(5)
scatter(x,y,'k','linewidth',2)
hold on
plot(sigma,derivada,'b','linewidth',2)
title('$\frac{\mathrm{d} \sigma }{\mathrm{d} x}= a\sigma +E_{0}$', 'Interpreter','latex')
ylabel('$\frac{\mathrm{d} \sigma }{\mathrm{d} x}$', 'Interpreter','latex')
xlabel('$\sigma$', 'Interpreter','latex')
grid on
%% grafica sigma
epsilon=0:0.001:800;
sigma=(E0/a)*(exp(a.*epsilon)-1);
figure(6)
scatter(e,sg,'linewidth',3)
ylabel('\sigma')
xlabel('\epsilon')
hold on
plot(epsilon,sigma,'k','linewidth',2)
grid on
%% grafica sigma analitica
epsilon=0:0.001:800;
sigma=(E0/a)*(exp(a.*epsilon)-1);
figure(6)
scatter(e,sg,'linewidth',3)
ylabel('\sigma')
xlabel('\epsilon')
hold on
plot(epsilon,sigma,'k','linewidth',2)
grid on