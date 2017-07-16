% we are sampling a sinusoid x=sin(2*pi*f*t);
f = 1000; %1kz frequency
T = 1/f;
tmin= 0;
tmax = 5*T;
% now we take samples at different rates in this interval;
t1= 1/5000; %sampling rate 5kz
t2 = 1/1500; %sampling rate 1.5kz
I1 = tmin:t1:tmax;
I2 = tmin:t2:tmax;
x1 = sin(2*pi*f*I1);
nfft1 = 2^(nextpow2(length(x1)));
x2 = sin(2*pi*f*I2);
nfft2 = 2^(nextpow2(length(x2)));
fftx1 = abs(fft(x1,nfft1));
fftx2 = abs(fft(x2,nfft2));
numuniquepoints1 = ceil((nfft1+1)/2);
fftx1 = fftx1(1:numuniquepoints1);
f1 = (0:numuniquepoints1-1)*5000/nfft1;
numuniquepoints2 = ceil((nfft2+1)/2);
fftx2 = fftx2(1:numuniquepoints2);
f2 = (0:numuniquepoints2-1)*1500/nfft2;
subplot(2,3,1);
plot(f1,fftx1);
subplot(2,3,2);
plot(f2,fftx2);
