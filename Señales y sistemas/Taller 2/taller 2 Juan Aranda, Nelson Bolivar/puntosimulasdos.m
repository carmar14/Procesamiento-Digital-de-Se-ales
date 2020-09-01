clear 
close all
clc
%punto 3-b

b=tf([1 6 7],[1 3 2]);

B=step(b);
subplot(3,3,1)
plot(B, 'LineWidth', 3);grid on;
title('respuesta temporal punto 3-b');
%punto 3-c
c=tf([2 1],[1 2]);
    C=step(c);
subplot(3,3,2)
plot(C, 'LineWidth', 3);grid on;
title('respuesta temporal punto 3-c');

%punto 3-e
e=tf([5 13],[1 4 13 0]);
    E=step(e);
subplot(3,3,3)
plot(E, 'LineWidth', 3);grid on;
title('respuesta temporal punto 3-e');

%punto 4.a si R=10K Y C=10UF
R=10000;
C=10;

h=tf([10],[(R*C) 1]);
H=step(h);
subplot(3,3,4)
plot(H, 'LineWidth', 3);grid on;
title('respuesta temporal punto 4-a');

%punto 4.b si R=10K Y C=10UF

h=tf([0 1],[(R*C) 1]);
H=step(h);
subplot(3,3,5)
plot(H, 'LineWidth', 3);grid on;
title('respuesta temporal punto 4-b');


