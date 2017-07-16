% normally distributed random variables
z = randn(1,1000);
z
subplot(2,3,1);
hist(z); %gives distribution of z as histograms
m = 0;
for i=1:1000
    m = m + z(i);
end
m = m/1000;
y1 = MEAN(z);
y1
m
variance = 0;
for i=1:1000
variance = variance + ((z(i)-m)*(z(i)-m));
end
variance = variance/1000;
y2 = std(z);
variance
y2
% normal gaussain rv
x = -20:0.1:20;
m = 3;
var = 4;
pdfnormal = normpdf(x,m,var);
%figure(2);
subplot(2,3,2);
plot(x,pdfnormal),axis([-20 20 0 0.1]);
%central limit thoerem
z1 = randn(100,1000);
mean = zeros(1,100);
mean
for i=1:100
mean(i) = mean(i) + sum(z1(i,:));
mean(i) = mean(i)/1000;
end
%figure(3);
subplot(2,3,3);
hist(mean);
% exponential distribution
h1 = icdf('exp',z,0.5);
subplot(2,3,4);
hist(h1);
h2 = icdf('rayl',z,0.5);
subplot(2,3,5);
hist(h2);