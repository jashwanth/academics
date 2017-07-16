%% simple quantization
% close all;
clear all;
t = -1:0.00001:1;
original =   sin(2*pi*2*t);%wavread('gulabi.wav');%
minimum = min(original);
SNR = [];
for i = 1:256
  yt = original - minimum;%making the signal positive
  NumberLevels = i;%input('Enter Number of levels:  ');
  yt = yt*(NumberLevels-1)/2;%scaling up the signal
  Qyt = round(yt);%quantizing the value
  Qyt = ((2*Qyt)/NumberLevels) + minimum;%scaling down the signal
  qerror = original - Qyt;
  SignalPower = sum(original.^2)/length(original);
  NoisePower = sum(qerror.^2)/length(qerror);
  SNR = [SNR,SignalPower/NoisePower];
end
figure,plot(SNR);
title('snr without companding')
xlabel('No. of levels')
ylabel('SNR')


%% u law companding
t = -1:0.001:1;
original_com = sin(2*pi*2*t);%wavread('gulabi.wav');%
u = 255;
minimum_com = min(original_com);
ut = [];
for i = 1:length(original_com)
 ut = [ut,sign(original_com(i))*(((log(1 + u*abs(original_com(i))))/(log(1+u))))];
end
%plot(ut);
SNR_com = [];
recov_com = [];
 for i = 1:256
yt_com = ut - minimum_com;
NumberLevels = i;%input('Enter Number of levels:  ');
yt_com = yt_com*(NumberLevels-1)/2;
Qyt_com = round(yt_com);
Qyt_com = ((2*Qyt_com)/NumberLevels) + minimum_com;
for i = 1:length(Qyt_com)
 recov_com = [recov_com,sign(Qyt_com(i))*(1/u)*(((1+u)^abs(Qyt_com(i)))-1)];
end
qerror_com = original_com - recov_com;
recov_com = [];
SignalPower_com = sum(original_com.^2)/length(original_com);
NoisePower_com = sum(qerror_com.^2)/length(qerror_com);
SNR_com = [SNR_com,SignalPower_com/NoisePower_com];
 end
 figure,plot(SNR_com,'g')
 title('snr with companding');
 xlabel('No. of levels')
 ylabel('SNR')
       