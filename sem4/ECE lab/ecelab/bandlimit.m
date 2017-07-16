close all;
clear all;
x = zeros(1,15);
z = ones(1,5);
for j = 6:10 
    x(1,j) = z(1,j - 5);
end;
figure(1);
plot(x);
y = fft(x);
figure(3);
plot(abs(y));
w = zeros(1,15);
for i = 6:10
    w(1,i) = y(1,i);
end;
figure(2);
plot(abs(w));
t = ifft(w);
figure(4);
plot(abs(t));
