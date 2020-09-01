close all;
clear all;

m='NOMBRE: JUAN CAMILO ARANDA, CODIGO:2150427';
disp(m)
t1=-10; t2=10;

%INICIO DE LA RAMPA EN T=-1

[U1,t]=escalon(-1,t1,t2);
Y1=(t+1).*(U1);
%CON ESTO EN T=0 LE RESTO A LA RAMPA EL VALOR DE ELLA MISMA Y Y(T)=0 EN X(0)
[U3,t]=escalon(0,t1,t2);
Y2=1.*(-U3).*(t+1);
%AQUI COMO ESTOY EN CERO CREO UN ESCALON UNITARIO EN T=0

[U5,t]=escalon(0,t1,t2);
 Y3=1.*(U5);
 %AQUI COMO EL ESCALON ANTERIO VA HASTA INFINITO Y NECESITO CORTARLO EN
 %T=1,CREO UN ESCALON EN T=1 Y LO RESTO CON EL ESCALON DE T=0

[U7,t]=escalon(1,t1,t2);
 Y4= 1.*(-U7);
 %AHORA EN T=1 Y(T)=0, ENTONCES NECESITO SUBIRLO A Y(t)=2,PARA ESO CREO
 %OTRO ESCALON EN T=1 PERO DE AMPLITUD 2

 [U8,t]= escalon(1,t1,t2);
 Y5=2.*U8;
 %COMO EL ESCALON DE AMPLITUD 2 CREADO EN T=1 SIGUE HASTA INFINITO,
 %NECESITO QUE VALGA Y(t)=0 EN T=2, PARA ESO LE RESTO OTRO ESCALON DE AMPLITUD 2
 %EN LA POSICION T=2

 [U9,T]= escalon(2,t1,t2);
 Y6=2.*(-U9);
 Yt=Y1+Y2+Y3+Y4+Y5+Y6;
 
  subplot(2,2,1)
  plot(t,Yt, 'LineWidth', 3);grid on;
  title('Señal y(t)');
 
 
 
 
 %ahora creare y(-t)
 %AQUI CREO UN ESCALON UNITARIO EN LA POSICION t=-2 Y LO AMPLIO POR 2, PARA
 %QUE Y(t)=2
 [U1,t]=escalon(-2,t1,t2);
 Y7= 2.*(U1);
%COMO EL ANTERIO ESCALON VA HASTA INFINITO, LO CORTO EN t=-1,RESTANDOLEOTRO
%ESCALON DE IGUAL VALOR AL ANTERIOR EN T=-1, PARA QUE Y(t)=0
 
 [U3,t]=escalon(-1,t1,t2);
 Y8=2.*(-U3);
% % %AQUI COMO ESTOY EN CERO, CREO UN ESCALON UNITARIO EN t=-1 PARA QUE
% Y(t)=1 EN T=-1
% % 
 [U5,t]=escalon(-1,t1,t2);
 Y9=1.*(U5);
% %  %AQUI COMO EL ESCALON ANTERIO VA HASTA INFINITO Y NECESITO CORTARLO EN
% %  %T=0,CREO UN ESCALON EN t=0 Y LO RESTO CON EL ESCALON ANTERIOR
% % 
[U7,t]=escalon(0,t1,t2);
Y10=1.*(-U7);
% %  %AHORA CREO LA RAMPA EN t=0
% % 
[U8,t]= escalon(0,t1,t2);
Y11=1.*(-U8).*(t-1);
   %como la rampa va hasta infinito la corto con un escalon del mismo valor
   %de la rampa en t=1
[U9,t]= escalon(1,t1,t2);
   Y12=1.*(U9).*(t-1);

 
 reflejo=Y7+Y8+Y9+Y10+Y11+Y12;


subplot(2,2,2)
plot(t,reflejo, 'LineWidth', 3);grid on;
title('Señal y(-t)');
 
 
 

% %AHORA VOY A HALLAR LA PARTE PAR E IMPAR
% %PARTE PAR:
% %(1/2)*y(t)+(1/2)X(-t)
 par=((1/2).*Yt)+((1/2).*reflejo);
 subplot(2,2,3)
 plot(t,par, 'LineWidth', 3);grid on;
 title('Señal Ye(t)-PARTE PAR DE LA SEÑAL Y(t)');
 
 

% %PARTE IMPAR:
% %(1/2)*y(t)-(1/2)X(-t)
 par=((1/2).*Yt)-((1/2).*reflejo);
 subplot(2,2,4)
 plot(t,par, 'LineWidth', 3);grid on;
 title('Señal Yo(t)-PARTE IMPAR DE LA SEÑAL Y(t)');
 