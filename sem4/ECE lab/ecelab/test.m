clear all;
close all;
x = 3:14;
y = 4.8.*exp(-1.4.*(x./10))+0.02.*exp(-0.01.*(x./10));
figure(1);
plot(x./10,y);