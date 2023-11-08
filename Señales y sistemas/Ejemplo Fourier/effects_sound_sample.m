clc
clear
close all

%-------ejemplo señal audio-----
[y,Fs] = audioread("DoorScrm.wav");
y=y(:,1);
%------vector de tiempo----
t=0:1/Fs:length(y)*(1/Fs)-(1/Fs);
t=t';
plot(t,y)
xlabel('Tiempo(seg)')
ylabel('y(t)')
title('Señal en el tiempo')
grid on
sound(y,Fs)

%-----calculo de los coeficientes de Fourier
%Compute the Fourier transform of the signal.
L=length(y);
Y = fft(y);
%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
Y_= 2*Y(1:L/2+1);
P2 = abs(Y/L);
figure
plot(2*P2);
P1 = 2*P2(1:L/2+1);


%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
f = Fs*(0:(L/2))/L;
figure
plot(f,P1,'r')%,f,P3,'k') 
title('Espectro de amplitud unilateral de y(t)')
xlabel('f (Hz)')
ylabel('|Y(f)|')
grid on
%-----calcular fase----
tol = 1e-6;
Y_(abs(Y_) < tol) = 0;
fase=rad2deg(angle(Y_));
figure
plot(f,fase,'r')
title('Fase de y(t)')
xlabel('f (Hz)')
ylabel('arg{Y(f)} °')
grid on
%-------ejemplo señal audio-----

% Parámetros del efecto Wah-Wah

fcMin = 300; % Frecuencia de corte mínima del filtro paso banda
fcMax = 2000; % Frecuencia de corte máxima del filtro paso banda
modulationRate = 1; % Tasa de modulación (ajusta según tus necesidades)

% Calcula el tiempo y la envolvente para el efecto Wah-Wah
t = (0:length(y)-1) / Fs;
envelope = 1 + sin(2 * pi * modulationRate * t);

% Inicializa la señal de salida
outputSignal = zeros(size(y));

% Aplica el efecto Wah-Wah
for i = 1:length(y)
    fc = fcMin + (fcMax - fcMin) * envelope(i);
    [b, a] = butter(2, [fc*0.8 fc*1.2]/(Fs/2), 'bandpass'); % Filtro paso banda
    outputSignal(i) = filter(b, a, y(i));
end

% Normaliza la señal de salida
outputSignal = outputSignal / max(abs(outputSignal));
pause(5)
% Reproduce la señal de salida
sound(outputSignal, Fs);

% Parámetros del efecto de reverberación
inputSignal = y;
reverbTime = 0.5; % Tiempo de reverberación (en segundos)
dampingFactor = 0.8; % Factor de amortiguación (ajusta según tus necesidades)
feedbackGain = 0.7; % Ganancia de realimentación (ajusta según tus necesidades)

% Calcula el número de muestras para el retardo de reverberación
delaySamples = round(reverbTime * Fs);

% Inicializa el buffer de retardo
delayBuffer = zeros(delaySamples, 1);

% Inicializa la señal de salida
outputSignal = zeros(size(inputSignal));

% Aplica el efecto de reverberación
for i = 1:length(inputSignal)
    % Calcula la salida del buffer de retardo
    delayOutput = delayBuffer(1);
    
    % Calcula la señal de salida en este punto
    outputSignal(i) = inputSignal(i) + feedbackGain * delayOutput;
    
    % Actualiza el buffer de retardo con la nueva muestra
    delayBuffer = [inputSignal(i) + dampingFactor * delayOutput; delayBuffer(1:end-1)];
end

% Normaliza la señal de salida
outputSignal = outputSignal / max(abs(outputSignal));
pause(5)
% Reproduce la señal de salida
sound(outputSignal, Fs);

% Parámetros del efecto de vibrato

vibratoDepth = 50; % Profundidad del vibrato en Hz (ajusta según tus necesidades)
vibratoRate = 4; % Frecuencia del vibrato en Hz (ajusta según tus necesidades)

% Inicializa la señal de salida
outputSignal = zeros(size(inputSignal));

% Aplica el efecto de vibrato
for i = 1:length(inputSignal)
    % Calcula el desplazamiento en muestras según el efecto de vibrato
    vibratoOffset = round(vibratoDepth * sin(2 * pi * vibratoRate * i / Fs));
    
    % Asegura que el desplazamiento no se salga de los límites
    if i - vibratoOffset >= 1 && i - vibratoOffset <= length(inputSignal)
        % Interpola linealmente para obtener la señal de salida con vibrato
        outputSignal(i) = (1 - abs(i - vibratoOffset - floor(i - vibratoOffset))) * inputSignal(floor(i - vibratoOffset)) ...
                          + abs(i - vibratoOffset - floor(i - vibratoOffset)) * inputSignal(ceil(i - vibratoOffset));
    end
end

% Normaliza la señal de salida
outputSignal = outputSignal / max(abs(outputSignal));

% Reproduce la señal de salida
pause(5)
sound(outputSignal, Fs);





