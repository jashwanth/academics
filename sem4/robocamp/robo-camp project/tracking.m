function [] = test(vid)
%TEST Summary of this function goes here
%   Detailed explanation goes here
vid = videoinput('winvideo', 2);
set(vid,'ReturnedColorSpace','rgb');
preview(vid);
state=0;
%s=serial('COM3', 'BaudRate', 9600, 'StopBits', 2);
while state<2000
    center=0;
    count=0;
    count1=0;
    data = getsnapshot(vid);
    imshow(data);
    for i=1:768
        for j=1:1024
            if (data(i,j,1)>150 && data(i,j,2)<100 && data(i,j,3)<100)
                count=count+1;
                center=center+j;
            end
            if(i>700 && data(i,j,1)>180 && data(i,j,2)<100 && data(i,j,3)<100)
               count1=count1+1;
            end
        end        
    end
%    count
    fprintf('precentre is %d\n',center);
    center=center/count;
    %fopen(s);
    fprintf('count is %d\n',count);
    fprintf('centre is %d\n',center);
   if(count1>20)
       disp('stop');
%        fwrite(s,'s');
%        break;
    else
        if(count > 20)
        if(center < 400)    
%            fwrite(s,'l');
            disp('right');
        elseif(center > 600)
%            fwrite(s,'r');
            disp('left');
        else
%            fwrite(s,'f');
            disp('forward');
        end
        elseif(count<=20)
%            fwrite(s,'l');
            disp('nothing');
        end
        state=state+1;
    end
%    fclose(s);
end
%fopen(s);
%fwrite(s,'s');
%fclose(s);
delete(vid);
end