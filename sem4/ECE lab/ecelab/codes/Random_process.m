%% calculating mean of the random process
clear all;
close all;
SamplePaths = 100;
A = 2;
wo = 1000;
u = rand(1,2000);
u = (u - 0.5).*2*pi;
hist(u);
n = linspace(-1,1,length(u));
xn = zeros(SamplePaths,length(n));%100 sample paths
for i = 1:SamplePaths
  u = rand(1,2000);
  u = (u - 0.5).*2*pi;
  xn(i,:) = A*cos(wo*n + u);
end
mean = zeros(1,SamplePaths);

for j = 1:SamplePaths  
  for i = 1:length(xn(j))
    mean(j) = mean(j) + xn(i)/length(xn);
  end
end

ensemble_mean = sum(mean)/length(mean);
fprintf('Mean of the process is %f\n',ensemble_mean);


%% autocorrelation calculation

sample = rand(1,1000);
sample = sample - 0.5;
sample = sample*2*pi;

k = 1;
ran = zeros(1,10000);
for i = 1:10:10000
  for j = 0:9
    ran(i+j) = sample(k);
  end
  k = k + 1;
end

t = linspace(-5,5,length(ran));
fs = 1/(t(2)-t(1));
y = cos(t*wo + ran );%random process

%%evaluating autocorr
Rx = zeros(1,length(ran));
for m = 1:length(ran)
    for n = 1:length(ran)-m
        Rx(m) = Rx(m) + y(n)*y(n+m-1);
    end
end

plot(Rx(3:end));%plotting the autocorrelation
%%plotting PSD 
faxis = linspace(-(fs/2),(fs/2),length(Rx));
figure,stem(faxis,abs(fftshift(fft(Rx))))

