clc
clear 
close all
%Simulacion de la se�al de la red electrica durante 5 minutos
t=0:1/6000:300;
y=120*sin(2*pi*60*t);
% Se�al original
plot(t,y)
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Se�al de la red electrica')


% Se�al original+ ruido
yr=y+15*sin(2*pi*80*t);  %Se a�ade un ruido de una se�al sinusoidal de 80 Hz
figure
plot(t,yr) 
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Se�al de la red electrica con ruido de 80 Hz')

%Se�al de Voltaje sag & swell
a1=0.8;
a2=1.1;
ym=zeros(1,length(y));
o=1;
for i=0:1/6000:300;
    if i>=0 && i<=120
        ym(o)=y(o);
    elseif i<=150
        ym(o)=a1*y(o);
    elseif i<=200
        ym(o)=y(o); 
    elseif i<=210
        ym(o)=a2*y(o);
    elseif i<=220
        ym(o)=a1*y(o); 
    elseif i<=250
        ym(o)=y(o);
    elseif i<=251
        ym(o)=a2*y(o);
    elseif i<=255
        ym(o)=a1*y(o); 
    elseif i<=300
        ym(o)=y(o); 
        
    end
    
    o=o+1;
end

figure
plot(t,ym)
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Se�al de la red electrica efectos sag y swell')


%Se�al de Voltaje sag & swell con ruido
o=1;
for i=0:1/6000:300;
    if i>=0 && i<=120
        ym(o)=yr(o);
    elseif i<=150
        ym(o)=a1*yr(o);
    elseif i<=200
        ym(o)=yr(o); 
    elseif i<=210
        ym(o)=a2*yr(o);
    elseif i<=220
        ym(o)=a1*yr(o); 
    elseif i<=250
        ym(o)=yr(o);
    elseif i<=251
        ym(o)=a2*yr(o);
    elseif i<=255
        ym(o)=a1*yr(o); 
    elseif i<=300
        ym(o)=yr(o); 
        
    end
    
    o=o+1;
end

figure
plot(t,ym)
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Se�al de la red electrica efectos sag y swell con ruido de 80 Hz')

%Proceso de filtrado de la se�al
load('filtro.mat')
%b=numerador del filtro FIR, a=denominador
b=filt1.tf.num;
a=filt1.tf.den;

%Se�al filtrada

yf=filter(b,a,ym);
figure
plot(t,yf)
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Se�al filtrada')


%Analisis en frecuencia
X_magr=abs(fft(ym));  %magnitud del espectro de la se�al con ruido
X_magf=abs(fft(yf));    %magnitud del espectro de la se�al sin ruido
%plot first half of DFT (normalised frequency)
Fs=6000;
fn= 0:Fs/length(X_magr):Fs/2 - 2/Fs;
figure
plot(fn,X_magr(1:length(X_magr)/2+1))
xlabel('Frecuencia (Hz)');
ylabel('|Ym(f)|')
title('Espectro de la se�al con ruido')

figure
plot(fn,X_magf(1:length(X_magf)/2+1))
xlabel('Frecuencia (Hz)');
ylabel('|Yf(f)|')
title('Espectro de la se�al filtrada')

%Espectrograma valores por default:  Ventana Hamming, Sobrelapamiento al
%50% entre ventanas
%spectrogram(yr,[],[],[],1/6000,'yaxis')
figure 
spectrogram(ym,[],[],[],Fs,'yaxis'); %Espectograma de se�al con ruido
figure 
spectrogram(yf,[],[],[],Fs,'yaxis'); %Espectograma de se�al filtrada

%Transformada de Wavelet Discreta aplicada en la se�al

[cA cD]=wavedec(yf,2,'db10');
reconstruccion_senal=waverec(cA,cD,'db10');
figure
plot(t,reconstruccion_senal)
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Se�al reconstruida')
% close all
% [cA cD]=dwt(yf,'db10');


%Series de Tiempo

Y=yf;

%Modelo ARX: Modelo discreto obtenido en ecuacion en diferencia es:
%Y(k)=4.9897*Y(k-1)-9.9653*Y(k-2)+9.9575*Y(k-3)-4.978*Y(k-4)+0.9961*Y(k-5);
y(1)=0;
y(2)=0;
y(3)=0;
y(4)=0;
y(5)=0;

for k=6:length(Y);

y(k)=4.9897*Y(k-1)-9.9653*Y(k-2)+9.9575*Y(k-3)-4.978*Y(k-4)+0.9961*Y(k-5);  %Se�al estimada

end
figure
plot(t,y)
hold on
plot(t,yf,'r')
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Se�al estimada a partir del modelo comparada con la se�al original')
legend('Se�al estimada','Se�al original')


