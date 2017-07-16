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


w = z.*cos(10000*t);
figure(2);
plot(t,w);
s = awgn(w,10);
figure(3);
plot(s);
c = s.*cos(10000.*t);

for l = 1:100
    c2= diff(fnval(fnint(c),[l-1 l]));
    if(abs(c2) > 0.8)
        out(l) = 1;
    else
        out(l) = 0;
    end;
end;
figure(4);
plot(out);