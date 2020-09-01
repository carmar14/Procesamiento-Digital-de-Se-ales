close all
clear all
clc

k1 = -0.90;
k2 = -0.90;
k3 = -0.87;
k4 = -1.02;
k5 = -0.81;
T1 = 33.3;
T2 = 27.7;
T3 = 491;
T4 = 50.6;
T5 = 203.5;
G1 = tf(k1,[T1 1]);
G2 = tf(k2,[T2 1]);
G3 = tf(k3,[T3 1]);
G4 = tf(k4,[T4 1]);
G5 = tf(k5,[T5 1]);
hold on
step(G1)
step(G2)
step(G3)
step(G4)
step(G5)
grid on
legend('G1','G2','G3','G4','G5')
figure
[numz1 denz1] = c2dm(k1,[T1 1], T1/10, 'foh'); 
G_d2 = c2d(G2, T2/10, 'foh'); 
G_d3 = c2d(G3, T3/10, 'foh'); 
G_d4 = c2d(G4, T4/10, 'foh'); 
G_d5 = c2d(G5, T5/10, 'foh');
hold on
step (tf(numz1,denz1,T1/10))
step (G_d2)
step (G_d3)
step (G_d4)
step (G_d5)
grid on
legend('G1d','G2d','G3d','G4d','G5d')

figure
hold on
pzmap(G1)
pzmap(G2)
pzmap(G3)
pzmap(G4)
pzmap(G5)
grid on

figure
hold on
pzmap(tf(numz1,denz1,T1/10))
pzmap(G_d2)
pzmap(G_d3)
pzmap(G_d4)
pzmap(G_d5)
grid on