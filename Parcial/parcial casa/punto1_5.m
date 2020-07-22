clear 
clc
close all
%Probando linealidad
n=0:3;
x1n=[-1 0 4 5];
x2n=[-4 5 -3 2];
y1n=zeros(1,4);
y2n=zeros(1,4);
%Calculo de y1n y y2n
y1n=(-1).^n.*x1n;
y2n=(-1).^n.*x2n;
yr=y1n+y2n;
%Calculo de yn con xn=x1n+x2n
xn=x1n+x2n;
yn=(-1).^n.*xn;
%Graficas
figure
stem(n,yr,'linewidth',2)
title('yn=y1n+y2n')
figure
stem(n,yn,'linewidth',2)
title('yn=(-1)^n*x(n)')

if (yn-yr)==0
    display('El sistema es lineal')
else
    display('El sistema no es lineal')
end

%Probando la varianza en el tiempo
k=1;
xn=[1 3 4 7];
i=0;
while (i<=k)
    yn1(i+1)=(-1)^n(i+1)*xn(i+k+1);
    i=i+1;
end

i=0;
while (i<=k)
    yn2(i+1+k)=(-1)^n(i+1+k)*xn(i+k+1);    
    i=i+1;
end
%Graficas
figure
stem(yn1,'linewidth',2);
title('Salida con la señal de entrada desplazada')
figure
stem(yn2,'linewidth',2);
title('Salida con la señal de salida desplazada')
if yn1==yn2(:,length(yn1)-k)
    display('El sistema es invariante')
else
    display('El sistema es variante')
end
    