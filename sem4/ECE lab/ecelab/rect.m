close all;
clear all;
x = zeros(1,15);
z = ones(1,5);
for i = 6:10 
    x(1,i) = z(1,i - 5);
end;
figure(1);
plot(x);
y = fft(x);
figure(2);
plot(abs(y));
d = y + rand(1,15);
figure(3);
plot(abs(d));
g = ifft(d);
figure(4);
plot(abs(g));
