close all;
clear all;
x1 = rand(1,10);
y1 = round(x1);
k = 1;
x2 = rand(1,10);
y2 = round(x2);
for i = 1:10
    for j = 1:10
        z1(k) = y1(i);
        z2(k) = y2(i);
        k = k+1;
    end;
end;
figure(1);
plot(z1);
figure(3);
plot(z2);
t= 0.1:1:100;
for l = 1:100
    if( z1(l) > 0)
        out1(l) = cos(10000.*l + pi./2);
    else
        out1(l) = 0;
    end;
    if( z2(l) > 0)
        out2(l) = cos(10000.*l);
    else
        out2(l) = 0;
    end;
end;
z = out1 + out2;
figure(2);
plot(z);
        