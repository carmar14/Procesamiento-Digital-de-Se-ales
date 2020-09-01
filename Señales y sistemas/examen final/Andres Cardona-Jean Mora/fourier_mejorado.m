%% SUMA DE LAS SERIES DE FOURIER
clc
clear
close all
syms n t
%AMPLITUD
A=1;
A0 = A/2;
T = 2*pi;
Arm = 20;
for n=1:Arm
%     f(n,:) = sum((An)*cos(n*w0*t)+(Bn)*sin(n*w0*t));
    f(n,:) = sum((1/(2*n-1)^2)*cos((2*(2*n-1)*pi*t)/T));
end
t = linspace(0, 2*T, 100);
f = subs(f, 't', t);
f(n+1,:) = zeros(1,100);
plot(t,A0-(4*A/(pi^2))*sum(f),'Linewidth',2);grid on
xlabel('\bfTIEMPO'); ylabel('\bfAMPLITUD'); title('\bf SERIE DE FOURIER')
%% SUMA DE LAS SERIES DE FOURIER ANIMADA
clc
clear
close all
syms n t
%AMPLITUD
A=1;
A0 = A/2;
T = 2*pi;
Arm = 20;
for n=1:Arm
    syms t
    f(n,:) = sum((1/(2*n-1)^2)*cos((2*(2*n-1)*pi*t)/T));
    t = linspace(0, 2*T, 100);
    subplot(3, 1, 1);
    plot(t, subs(A0-(4*A/(pi^2))*f(n,:), 't', t)); grid on
    xlabel('\bfTIEMPO'); ylabel('\bfAMPLITUD'); title('\bfCOMPONENTE')
    hold on
    subplot(3, 1, 2);
    plot(t,subs(A0-(4/(pi^2))*sum(f), 't', t), 'r', 'Linewidth',1.5);grid on
    xlabel('\bfTIEMPO'); ylabel('\bfAMPLITUD'); title('\bfSERIE DE FOURIER')
    pause(0.1)
end







