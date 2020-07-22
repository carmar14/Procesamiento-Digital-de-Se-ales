% PROGRAMA PARA GENERAR SEÑALES ALEATORIAS 
% REALIZADO POR BELARMINO SEGURA GIRALDO
% UNIVERSIDAD AUTONOMA DE MANIZALES 
% 2017

clc
clear all

% DECLARAR LOS VECTORES QUE GUARDAN LAS SEÑALES OBTENIDAS

X1=0;
X2=0;
Y1=0;
Y2=0;

% CICLO PARA GENERAR LA SEÑAL X COMO FUNCION DE COSENOS

% DECLARAR EL RANGO DE TIEMPO

t=0:0.1:100;

for i=1:1000
    
    a=randi(100);
    b=randi(100);
    c=randi(100);
    x1=(-1)^i*a*cos(pi*b*t)+b*sin(pi*c*t);
    x2=(-1)^i*a*cos(b*t)+b*sin(c*t);
    X1=X1+x1;
    X2=X2+x2;    
end

% CICLO PARA GENERAR LA SEÑAL Y COMO FUNCION DE EXPONENCIALES

% DECLARAR LAS VARIABLES DE LA EXPONENCIAL

t=200:5:700;
a=randn(1,100);
b=randi(700,1,100);
c=randi(100,1,100);
    
for i=1:100
    y1=a(i)*exp(-11*((t-b(i))/c(i)).^2);
    y2=(-1)^i*a(i)*exp(-2*((t-b(i))/c(i)).^2);
    Y1=Y1+y1;
    Y2=Y2+y2;
end

% GRAFICAR LAS SEÑALES OBTENIDAS

figure
subplot(2,2,1), plot(X1)
subplot(2,2,2), plot(X2)
subplot(2,2,3), plot(Y1)
subplot(2,2,4), plot(Y2)

