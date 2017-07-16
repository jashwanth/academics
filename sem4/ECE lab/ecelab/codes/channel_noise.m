close all;
clear all;

%%generating the signal
t = -20:20;
pulse = [zeros(1,18),ones(1,5),zeros(1,18)];


%%plotting the original signal
figure,stem(t,pulse,'k'),
title('original signal');
xlabel('t (sec) -->');
ylabel('signal value x(t) -->')

%%calculating the fourier transform
pf = fft(pulse);
mag_pf = fftshift(abs(pf));
ang = fftshift(unwrap(angle(pf)));
faxis = linspace(-0.5,0.5,length(pf));

%%plotting the magnitude spectrum of signal
% figure,stem(faxis,mag_pf);
% title('dft of the original signal');

%%introducing random channel noise
for j = 1:length(pf),
     random(j) = pf(j)*exp(10*i*randn(1)); %changing phase
%     random(j) = pf(j)*rand(1);%changing magnitude
%     random(j) = pf(j) + randn(1);%changing both magnitude and phase
end

%%calculating the recieved signal
r_ang =  fftshift(unwrap(angle(random)));
inv = ifft(random);

%%plotting the phase spectrum of the signals
figure,plot(faxis,ang,'r',faxis,r_ang,'b');
title('Phase spectrum of the signals');
Hleg = legend('original signal','random signal');
set(Hleg,'location','northeastoutside')
hold off;

%%plotting the regenerated signal
figure,stem(t,inv);
title('Regenerated signal(original in green)');
xlabel('t (sec) -->');
ylabel('x(t) -->');
hold on;
stem(t,pulse,'g');
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%bandlimit the channel
for i = 1:length(pf),
    if  i > 20
        pfl(i) = 0;
    else
        pfl(i) = pf(i);
    end
end

%%calculate the band limited value
new_pulse = ifft(pfl);

%%plotting the output of bandlimited channel
figure,stem(t,new_pulse);
title('Effect of bandlimited channel(original in green)');
xlabel('t (sec -->)');
ylabel('x(t) -->');
hold on;
stem(t,pulse,'g');
hold off;

