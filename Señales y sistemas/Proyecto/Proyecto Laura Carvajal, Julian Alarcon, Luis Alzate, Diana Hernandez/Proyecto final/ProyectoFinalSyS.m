%%
%Lectura del audio y su transformada
[Audio fs]=audioread('G:\Laura\Proyecto final\Xantos - Bailame Despacio.mp3'); %%lee el sonido y retorna la se�al en funcion del tiempo y la frecuencia de muestro fds
L=length(Audio);%%retorna el tama�o del vector audio( son numeros como un arreglo)
nfourier=2^nextpow2(L);%% haya el ultimo numero en base 2 para hallar el ancho del eje x
AudioF=fft(Audio,nfourier)/L;%% hace la transformada rapida de fourier a la se�al audio


%Vector tiempo para la se�al de audio y para dominio en frecuencia
t=1:L; %%crea un vector de 1 hasta L
n=fs*linspace(0,1,nfourier/2+1);%% n va a ser lo mismo que t pero para fourier, fs es la frecuencia de muestreo, crea un linspace(se hace un vector)el primer numero es de donde empieza el vector, el segundo hasta donde va y el ultimo numero es la cantidad de numeros que vas a meter entre 0 y 1

%%
%Asignacion de los filtros a una variable
MediasAltas=FMediasAltas; %% llamo e filtro y  lo renombro

%Aplicacion del filtro
AuMeAl=filter(MediasAltas,Audio); %% creo una variable donde voy a meter la se�al a la cual le voy a aplicar el filtro
AuMeAlF=fft(AuMeAl,nfourier)/L; %% le hacemos la transformada rapida de fourier
%%
%Asignacion de los filtros a una variable
Grave=FGrave;

%Aplicacion del filtro
AuGra=filter(Grave,Audio);
AuGraF=fft(AuGra,nfourier)/L;
%%
%Asignacion de los filtros a una variable
MediasBajas=FMediasBajas;

%Aplicacion del filtro
AuMeBa=filter(MediasBajas,Audio);
AuMeBaF=fft(AuMeBa,nfourier)/L;
%%
%Asignacion de los filtros a una variable
Brillo=FBrillo; %% es la mas alta 

%Aplicacion del filtro
AuBrillo=filter(Brillo,Audio);
AuBrilloF=fft(AuBrillo,nfourier)/L;
%%
figure(1);
subplot(2,2,1) %% 2 cantidad de columnas,2 cantidad de filas, 1 posicion
plot(t,Audio)
title('Audio Original');
subplot(2,2,2)
plot(t,AuGra)
title('Audio filtro Grave');
subplot(2,2,3)
plot(n,2*abs(AudioF(1:nfourier/2+1))) %% evita que me salgan numeros negativos,2*abs 2 por absolut 
title('Espectro audio original');
subplot(2,2,4)
plot(n,2*abs(AuGraF(1:nfourier/2+1)))
title('Espectro audio filtro grave');

figure(2);
subplot(2,2,1)
plot(t,Audio)
title('Audio Original');
subplot(2,2,2)
plot(t,AuMeBa)
title('Audio filtro Medias-Bajas');
subplot(2,2,3)
plot(n,2*abs(AudioF(1:nfourier/2+1)))
title('Espectro audio original');
subplot(2,2,4)
plot(n,2*abs(AuMeBaF(1:nfourier/2+1)))
title('Espectro audio filtro Medias-Bajas');

figure(3);
subplot(2,2,1)
plot(t,Audio)
title('Audio Original');
subplot(2,2,2)
plot(t,AuMeAl)
title('Audio filtro Medias-Altas');
subplot(2,2,3)
plot(n,2*abs(AudioF(1:nfourier/2+1)))
title('Espectro audio original');
subplot(2,2,4)
plot(n,2*abs(AuMeAlF(1:nfourier/2+1)))
title('Espectro audio filtro Medias-Altas');

figure(4);
subplot(2,2,1)
plot(t,Audio)
title('Audio Original');
subplot(2,2,2)
plot(t,AuBrillo)
title('Audio filtro Brillo');
subplot(2,2,3)
plot(n,2*abs(AudioF(1:nfourier/2+1)))
title('Espectro audio original');
subplot(2,2,4)
plot(n,2*abs(AuBrilloF(1:nfourier/2+1)))
title('Espectro audio filtro Brillo');
%% reporduce sonidos
%sound(Audio,fs)
% sound(AuGra,fs)
% sound(AuMeBa,fs)
% sound(AuMeAl,fs)
 sound(AuBrillo,fs)
