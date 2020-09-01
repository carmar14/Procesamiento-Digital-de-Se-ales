% Punto 3 B
n1=[1 6 7];
d1=[1 3 2];
figure(1)
impulse(n1,d1)
title ('Respuesta a un impulso');
xlabel ('tiempo(seg)');
% Punto 3 D
n2=[1 6 7];
da=conv([1 5],[1 5]);
d2=conv(da,[1 3]);
figure(2)
impulse(n2,d2)
title ('Respuesta a un impulso');
xlabel ('tiempo(seg)');
%Punto 3 C
n3=[2 1];
d3=[1 2];
figure(3)
impulse(n3,d3)
title ('Respuesta a un impulso');
xlabel ('tiempo(seg)');
%Punto 1 E
n4=[5 13];
d4=conv([1 0],[1 4 13]);
figure(4)
impulse(n4,d4)
title ('Respuesta a un impulso');
xlabel ('tiempo(seg)');
%Punto 7 C
numz1=[0.02909 0.02721];
denz1=[1 -1.753 0.8187];
sys1=tf(numz1,denz1,1/20);
figure(5)
step(sys1,2)
title ('Respuesta a un escalon');
xlabel ('tiempo(seg)');
%Punto 7 D
numz2=0.06727;
denz2=[1 -0.9231];
sys2=tf(numz2,denz2,1/20);
figure(6)
step(sys2,2)
title ('Respuesta a un escalon');
xlabel ('tiempo(seg)');
%Punto 7 E
numz3=[0.001847 0.001847];
denz3=[1 -1.847 0.8521];
sys3=tf(numz3,denz3,1/20);
figure(7)
step(sys3,2)
title ('Respuesta a un escalon');
xlabel ('tiempo(seg)');
%Punto 7 F
numz4=[0.004528 0.004528];
denz4=[1 -1.81 0.8187];
sys4=tf(numz4,denz4,1/20);
figure(8)
step(sys4,2)
title ('Respuesta a un escalon');
xlabel ('tiempo(seg)');
% Punto 4 A
% Asumiendo  C = 470uF y R=10kohm
n6=(1/(10000));
d6=[1 (1/(10000*0.00047))];
figure(9)
step(n6,d6)
title ('Respuesta a un escalon');
xlabel ('tiempo(seg)');
% Punto 4 B
% Asumiendo  C = 470uF y R=10kohm
n7=(1/(10000*0.00047));
d7=conv([1 0],[1 (1/(10000*0.00047))]);
figure(10)
step(n7,d7)
title ('Respuesta a un escalon');
xlabel ('tiempo(seg)');