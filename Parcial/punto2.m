close all
clear
clc
n=0:255;
x=0.8*sin(2*pi.*n/128)+0.2*cos(2*pi*32.*n/128)+0.2*cos(2*pi*63.*n/128+pi/3);

M=8;

for i=0:M-1
    if 0<=i && i<M
        h(i+1)=1/M;
    else
        h(i+1)=0;
    end
end


stem(n,x)
title('Senal xn')
figure
stem(n(1:M),h)
title('Senal h')

%Calculo usando la convulucion
L=length(x);
M=length(h);
tamY=M+L-1;
% hnew=zeros(L,1)';
% for k=0:tamY
%  hnew
%  =h(r+1);
% y(k+1)=sum(x.*)
% 
% end
y=conv(x,h);
figure
stem(y)
%Calculo usando la DFT
x=[x zeros(1,tamY-L)];
X=fft(x);
h=[h zeros(1,tamY-M)];
H=fft(h);
Y=X.*H;
yf=ifft(Y);
figure   
stem(yf)

r=y-yf;   

