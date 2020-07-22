close all
clear
clc
n=0:256;    %Graficar dos periodos de la Señal , Np=128
x=0.8*sin(2*pi.*n/128)+0.2*cos(2*pi*32.*n/128)+0.2*cos(2*pi*63.*n/128+pi/3);

M=200;

for i=0:M-1
    if 0<=i && i<M
        h(i+1)=1/M;
    else
        h(i+1)=0;
    end
end


stem(n,x) 
title('Señal xn')
figure
stem(n(1:M),h)
title('Señal h')

%Calculo usando la convulucion
L=length(x);
M=length(h);
tamY=M+L-1;
y=conv(x,h);
figure
stem(y)
title('y(n) Usando la convolucion')
%Calculo usando la DFT
xa=[x zeros(1,tamY-L)];
X=fft(xa);
ha=[h zeros(1,tamY-M)];
H=fft(ha);
Y=X.*H;
yf=ifft(Y);
figure   
stem(yf)
title('y(n) Usando DFT')


