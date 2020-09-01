%Serie de Fourier de una señal cuadrada , con T=2pi
%Simetria impar: Solo se calculan los coeficientes  bn
%Simetria de media onda: solo existen armonicos impares

%bn=A(1-2cos(npi)+cos(2npi))/(npi)

%Reconstruccion de la señal
 

function []=ejemplo1(a,A)
    close all
    tamano=get(0,'ScreenSize');
    
    t=0:0.01:4*pi;%6*pi;
    f=zeros(a,length(t));
    for n=1:a
        bn=A*(1-2*cos(n*pi)+cos(2*n*pi))/(n*pi);
        f(n,:)=bn*sin(n.*t);
        
    end
    
    fr=sum(f);
    
    plot(t,fr)
    title('Señal reconstruida a partir de n armonicos')
    
    fn=zeros(2*a,length(t));
    for n=1:2*a
        bn=A*(1-2*cos(n*pi)+cos(2*n*pi))/(n*pi);
        fn(n,:)=bn*sin(n.*t);
    end
    
    fr=sum(fn);
    figure
    plot(t,fr)
    title('Señal reconstruida a partir de 2*n armonicos')
      
    
    %Animacion

    figure('position',[tamano(1) tamano(2) tamano(3) tamano(4)])
    fa=zeros(1,length(t));
    for n=1:a
        if rem(n,2)==1
            fa(1,:)=fa(1,:)+f(n,:);
            for j=1:length(t)
                z(n,j)=n; 
                %Grafica de cada armonico
                subplot(1,2,1)
                plot3(z(n,1:j),t(1:j),f(n,1:j))
                title('Grafica de cada armonico')
                grid on
                hold on
               %Grafica de onda cuadrada
                subplot(1,2,2)
                plot(t(1:j),fa(1,1:j))
                title('Grafica de onda cuadrada')
                hold on
                grid on
                pause(0.0001)
            end
        end
    end
    


    
    