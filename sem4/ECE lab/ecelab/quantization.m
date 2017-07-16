clear all;
close all;
t = 0.1:0.1:10;
x = sin(t)./2;
m = max(abs(x));
m
y = x + m;
z = round(y);
figure(1);
plot(z);
n= [8 16 32 64 128 256];
for i = 1:6 
c = ((n(i)-1).*y)./(2.*m);
w = round(c);
a_quant = (2.*w.*m)./(n(i)-1) - m;
e = x - a_quant;
s_sig =0;
e_sig = 0;

for j = 1:1:100
    s_sig = a_quant(j).*a_quant(j) + s_sig;
    e_sig = e(j).*e(j) + e_sig;
end;
snr(i) = s_sig./e_sig;
end;
figure(2);

plot(n,snr);