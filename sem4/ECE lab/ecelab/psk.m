close all;
clear all;
x = rand(1,10);
y = round(x);
k = 1;
for i = 1:10
    for j = 1:10
        z(k) = y(i);
        k = k+1;
    end;
end;
figure(1);
plot(z);
t= 0.1:1:100;
for l = 1:100
    if( z(l) > 0)
        out(l) = cos(10000.*l + pi./4);
    else
        out(l) = cos(10000.*l - pi./4);
    end;
end;
figure(2);
plot(out);
        