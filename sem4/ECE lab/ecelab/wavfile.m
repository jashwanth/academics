clear all;
close all;
t = 0.1:0.1:10;
fs = 200;
nbit=1024;
[x,fs,nbit]=wavread('test1.wav');
sound(x,fs);
m = max(abs(x));
y = x + m;
z = round(y);
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
sound(a_quant,fs);
snr(i) = s_sig./e_sig;
end;

figure(1);

plot(n,snr);