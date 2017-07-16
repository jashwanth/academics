t=0:0.001:0.04;
%Fs = 1000Hz
a =  sin(2*pi*50*t);
b= 1 + sin(2*pi*50*t);
% subplot(2,4,1);
%length(a)
%length(b)
figure(1);
plot(t,b);
c = (255 * b)/2; 
d = round(c);
%length(c)
length(d)
%ubplot(2,4,2);
figure(2);
plot(t,d);
%length(a_quant(1,:))
%n = [2 4 8 16 32 64 128 256 512 1024];
a_quant = zeros(10,41);
a_error = zeros(10,41);
for i=1:10
a_quant(i,:)= ((2*d)/((2^i)-1));
end
a_error(i,:) = a - a_quant(i,:);
for i=1:10
    a_error(i,:) = a_error(i,:)*a_error(i,:);
end
%figure(3);
%plot(t,a_error);
%hp = spectrum.periodogram('hamming');  % Create periodogram
p_signal = zeros(1,10);
p_error = zeros(1,10);
SNR     = zeros(1,10);
for j=1:10
for i=1:41
   p_signal(j) = p_signal(j) + (a(i)*a(i));
  % p_error(j)  = p_error(j)  + (a_error(j,i)*a_error(j,i));
end
end
%for i=1:10
 %   p_error(i) = p_error(i) + sum((((a_error(i,:))*(a_error(i,:))),41);
%end
p_error
for i=1:10
SNR(i) = p_signal(i)/p_error(i);
end
SNR