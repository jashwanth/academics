clear all;
close all;
t = 0.1:0.1:10;
x = sin(t);
figure(1);
plot(x);
for i = 1:100
    m  = 1 + 255*abs(x(i));
y(i) = (sign(x(i))*log(m))./log(256);
end;
figure(2);
plot(y);
e = y - x;
s_sig =0;
e_sig = 0;

for j = 1:1:100
    s_sig = y(j).*y(j) + s_sig;
    e_sig = e(j).*e(j) + e_sig;
end;
snr = s_sig/e_sig;
