fx = rand(1000);
nx = randn(1000);
figure,hist(fx);
title('Uniform Random variable pdf');
figure,hist(nx);
title('Normal random variable pdf');
%%calculation of mean
efx = 0;%uniform rv
for i = 1:length(fx)
efx = efx + fx(i)/length(fx);
end
enx = 0;%gaussian rv
for i = 1:length(nx)
enx = enx + nx(i)/length(nx);
end
%%calculation of variance
efx2 = 0;%uniform rv
for i = 1:length(fx)
efx2 = efx2 + ((fx(i))^2)/length(fx);
end
varfx = efx2 - efx^2;
enx2 = 0;%gaussian rv
for i = 1:length(nx)
enx2 = enx2 + ((nx(i))^2)/length(nx);
end
varnx = enx2 - enx^2;
fprintf('the mean/variance of uniform random variable is %f/%f\n',efx,varfx);
fprintf('the mean/variance of gaussian random variable is %f/%f\n',enx,varnx);
%%generating exp/rayleigh distribution using uniform rv
%use of icdf
exponential = icdf('exp',fx,2);
rayleigh = icdf('rayl',nx,2);
figure,hist(exponential);
title('exponential distribution generated using uniform rv');
figure,hist(rayleigh);
title('rayleigh distribution generated using Gaussian rv')
%%verification of central limit theorem
for i = 1:1000
  for j = 1:1000
    mat(i) = mat(i) + unif(i,j)/1000;
  end
end
figure,hist(mat);
title('verification of central limit theorem');
xlabel('normal distribution');
