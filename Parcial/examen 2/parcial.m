clc
clear 
close all
datos=load('datos.mat');
datos=datos.Folds5x2pp;
[m n]=size(datos);
Ts=1;  %1 muestra cada hora
t=0:Ts:m*Ts-Ts;  %Vector de tiempo en horas
Temperatura=datos(:,1);
Presion_vapor_esc=datos(:,2);
Presion_atmosferica=datos(:,3);
RH=datos(:,4);
Salida_Energia=datos(:,5);
%Matriz de correlacion
m=[Temperatura Presion_vapor_esc Presion_atmosferica RH Salida_Energia];
corr(m)

%Grafica de datos individuales
%Grafica de Temperatura
figure
plot(t,Temperatura)
title('Temperatura promedio del ambiente')
xlabel('Tiempo(h)');
ylabel('°C');
%Grafica de Presión de vapor de escape
figure
plot(t,Presion_vapor_esc)
title('Presión de Escape de Vapor')
xlabel('Tiempo(h)');
ylabel('cm Hg');
%Grafica de Atmosferica
figure
plot(t,Presion_atmosferica)
title('Presión atmosférica')
xlabel('Tiempo(h)');
ylabel('mbar');
%Grafica de Presión de vapor de escape
figure
plot(t,RH)
title('Humedad Relativa')
xlabel('Tiempo(h)');
ylabel('%RH'); 


%Muestreo dela señal
%Filtro de media movil promedio
coef=ones(1,24)/24; %ones(1,24)/24;
%Suavizado de datos
Temp3=filter(coef,1,Temperatura);
Temp=medfilt1(Temperatura,3); %medfilt1(Temperatura,3);
%Visualizacion de datos suavizados
figure
plot(t,Temp);
hold on
plot(Temperatura)
title('Filtro de Media Móvil')

figure
plot(t,Temp3);
hold on
plot(Temperatura)
title('Filtro de Media Móvil Ventana de 1 día')
%Filtro de smooth
load('señalFiltrada.mat');
yy = filt;
figure 
plot(t,yy);
hold on
plot(Temperatura)
title('Filtro Smooth- Usando Ventana Gaussiana')

%Filtro de Savitzky-Golay

%Suavizado de datos
% Temp2=sgolayfilt(Temp3,5,7);
% %Visualizacion de datos suavizados
% figure
% 
% plot(t,Temp2);

%Suavizado de datos
% Temp=abs(hilbert(Temperatura));
% Temp=Temp'/5;
% 
% %Visualizacion de datos suavizados
% figure
% plot(Temperatura)
% hold on
% plot(t,[-1;1]*Temp,'r','LineWidth',2);

%Analisis en frecuencia
L=length(Temperatura);
NFFT = 2^nextpow2(L);
Fs=Ts/3600;
Y = fft(Temperatura,NFFT)/L;
Y2 =fft(Temp3,NFFT)/L;
Y3 =fft(yy,NFFT)/L;
Y4=fft(Temp,NFFT)/L;

f = Fs/2*linspace(0,1,NFFT/2+1);  %magnitud del espectro de la señal con ruido
% X_magf=abs(fft(Temp));    %magnitud del espectro de la señal sin ruido
%plot first half of DFT (normalised frequency)


% fn= 0:Fs/length(X_magr):Fs/2 - 2/Fs;
figure
plot(f,2*abs(Y(1:NFFT/2+1)))
xlabel('Frecuencia (Hz)');
ylabel('|Ym(f)|')
title('Espectro de la señal con ruido')
figure
plot(f,2*abs(Y2(1:NFFT/2+1)))
xlabel('Frecuencia (Hz)');
ylabel('|Yf(f)|')
title('Espectro de la señal filtrada con filtro de media móvil')
figure
plot(f,2*abs(Y4(1:NFFT/2+1)))
xlabel('Frecuencia (Hz)');
ylabel('|Yf(f)|')
title('Espectro de la señal filtrada con filtro de ventana de 1 día')
figure
plot(f,2*abs(Y3(1:NFFT/2+1)))
xlabel('Frecuencia (Hz)');
ylabel('|Yf(f)|')
title('Espectro de la señal filtrada con Ventana de Gauss')

%Analisis Tiempo Frecuencia

% %Espectrograma valores por default:  Ventana Hamming, Sobrelapamiento al
% %50% entre ventanas
figure
spectrogram(Temperatura,100,30,128,1/3600,'yaxis')
title('Espectrograma de la Temperatura')
figure
spectrogram(Temp,108,30,128,1/3600,'yaxis')
title('Espectrograma de la Señal Filtrada con un filtro de media movil')
figure 
spectrogram(Temp3,128,30,2*128,1/3600,'yaxis'); %Espectograma de señal con ruido
title('Espectrograma de la Señal Filtrada con una ventana de 24 horas')
figure 
spectrogram(yy,100,30,128,1/3600,'yaxis'); %Espectograma de señal filtrada
title('Espectrograma de la Señal Filtrada con Smooth')

%Transformada de Wavelet Discreta aplicada en la señal

[cA cD]=wavedec(yy,5,'db8');
reconstruccion_senal=waverec(cA,cD,'db8');
figure
plot(t,reconstruccion_senal)
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Señal reconstruida')
%Analisis tiempo frecuencia de los niveles de  descomposicion

for i=1:sum(cD)-cD(end)
    for j=1:6;
        if j==1
            cA5=cA(1:cD(j));
            
            a=cD(j);
        end
        if j==2
            cD5=cA(a+1:a+cD(j));
            a=cD(j)+a;
        end
        if j==3
            cD4=cA(a+1:a+cD(j));
            
            a=cD(j);
        end
        if j==4
            cD3=cA(a+1:a+cD(j));
            a=cD(j)+a;
        end
        if j==5
            cD2=cA(a+1:a+cD(j));
            a=cD(j)+a;
        end
        if j==6
            cD1=cA(a+1:a+cD(j));
            a=cD(j)+a;
        end
        
    end
end
figure 
spectrogram(cA5,[],[],[],1/3600,'yaxis'); 
figure 
spectrogram(cD5,[],[],[],1/3600,'yaxis'); 
figure 
spectrogram(cD4,[],[],[],1/3600,'yaxis'); 
figure 
spectrogram(cD3,[],[],[],1/3600,'yaxis'); 
figure 
spectrogram(cD2,[],[],[],1/3600,'yaxis'); 
figure 
spectrogram(cD1,[],[],[],1/3600,'yaxis'); 


% 
%Series de Tiempo

%Para vetana de 24 horas
Y=Temp3;

%Modelo ARX: Modelo discreto obtenido en ecuacion en diferencia es:
%Y(k)=0.998*Y(k-1)+1.67*Y(k-2)-1.853*Y(k-3)-0.6019*Y(k-4)+0.8804*Y(k-5)-0.09721*y(k-6);
y(1)=0;
y(2)=0;
y(3)=0;
y(4)=0;
y(5)=0;
y(6)=0;

for k=7:length(Y);

y(k)=0.998*Y(k-1)+1.67*Y(k-2)-1.853*Y(k-3)-0.6019*Y(k-4)+0.8804*Y(k-5)-0.09721*y(k-6);  %Señal estimada

end
figure
plot(t,y)
hold on
plot(t,Temp3,'r')
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Señal estimada a partir del modelo comparada con la señal original')
legend('Señal estimada','Señal original')

% ARMABSG;

% 1 - 4.924 (+/- 0.01578) z^-1 + 10.51 (+/- 0.07046) z^-2 - 12.45 (+/- 0.1316) z^-3 + 8.643 (+/- 0.1285) z^-4       
%                                                                    - 3.334 (+/- 0.06574) z^-5 + 0.5586 (+/- 0.01409) z^-6
%Para ventana de Gauss

Y=yy;

%Modelo ARX: Modelo discreto obtenido en ecuacion en diferencia es:
%Y(k)=4.924*Y(k-1)-10.51*Y(k-2)+12.45*Y(k-3)-8.643*Y(k-4)+3.334*Y(k-5)-0.5586*y(k-6)
y(1)=0;
y(2)=0;
y(3)=0;
y(4)=0;
y(5)=0;
y(6)=0;

for k=7:length(Y);

y(k)=4.924*Y(k-1)-10.51*Y(k-2)+12.45*Y(k-3)-8.643*Y(k-4)+3.334*Y(k-5)-0.5586*y(k-6);  %Señal estimada

end
figure
plot(t,y)
hold on
plot(t,yy,'r')
xlabel('Tiempo(s)');
ylabel('Amplitud(V)')
title('Señal estimada a partir del modelo comparada con la señal original')
legend('Señal estimada','Señal original')
% 
