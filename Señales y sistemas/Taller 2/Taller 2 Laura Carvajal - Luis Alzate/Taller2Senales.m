%%
clear all
close all
clc

num=[1 6 7];
dem=[1 3 2];

num2=[2 1];
dem2=[1 2];

num3=[1 6 7];
dem3=conv([1 3],[1 10 25]);

subplot(3,1,1)
impulse(num,dem)

subplot(3,1,2)
impulse(num2,dem2)

subplot(3,1,3)
impulse(num3,dem3)
