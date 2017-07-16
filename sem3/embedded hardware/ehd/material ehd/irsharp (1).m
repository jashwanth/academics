function parseSerialData_IR(T)

if ~isempty(instrfind)
    fclose(instrfind);
end
tic
s = serial('COM9','BAUD',57600);
fopen(s);

CorrectHeaders = [ 1 0 ]*128;
k=uint8(fread(s,10)');
t1=toc

adc=0;
time=0;
p=0;
for t=1:T
   
    tic
    Data = uint8(fread(s,512)');
    t1=toc;
    time=[time (p + t1/255):t1/255:(p + t1)];
    
    p=time(length(time));
    Heads = find(bitand(Data, 224)==128);
    z = 1;
    for i=2:length(Heads)
        if Heads(i)== (Heads(i-1) + 2)
            temp = Heads(i-1):(Heads(i-1)+1);
            if all( bitand(Data(temp),224) == CorrectHeaders )
                Vals(z,:) = double((bitand(Data(temp),31)));
                z = z+ 1;
            end
        end
    end
    
   actual_data = [(Vals(:,1) + Vals(:,2)*32 )']
   adc=[adc actual_data];
end

plot(adc);
adc=[adc' time'];
dlmwrite('data.txt',adc(:,:,1),' ');
fclose(s);


end