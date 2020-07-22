close all
clear 
clc
N=5
n=0:N;
a=0.8;
x=a.^n;
stem(n,x)
for k=1:N
    X(k)=1/(1-a*exp(-j*2*pi*k/N));
end
k=0:N-1
figure
stem(k,X)

N=50
n=0:N;
a=0.8;
x=a.^n;
figure
stem(n,x)
for k=1:N
    X(k)=1/(1-a*exp(-j*2*pi*k/N));
end
k=0:N-1
figure
stem(k,X)

