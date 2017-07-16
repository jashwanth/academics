clear all;
close all;
fc = input('enter frequency of the sinosoid :-  ');
fsampling = input('enter sampling frequency :-  ');
tsampling = 1/fsampling;
A = 5;
t = -0.5:tsampling:0.5;                                                                                  
xt = A*sin(2*pi*fc*t);
% % stem(t,xt);
% xlabel('t(sec) -->');
% ylabel('x(t) -->');
% title('Time Domain Plot')
% hold on;
nfft = 1024;
xf = fft(xt,nfft);
mag_xf = abs(fftshift(xf));
angle_xf  = unwrap(angle(xf));
fspacing = fsampling/nfft;
fstart = -fsampling/2;
fend = fsampling/2 - fspacing;
faxis = fstart:fspacing:fend;
stem(faxis,mag_xf);
% inv_xf = ifft(xf);
% reconst_xt = ifftshift(inv_xf);
% stem(t,inv_xf(1:length(t)),'g');

