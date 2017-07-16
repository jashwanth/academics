function [] = test(vid)
%TEST Summary of this function goes here
%   Detailed explanation goes here
vid = videoinput('winvideo', 1, 'RGB24_320x240');
preview(vid);
state=0;
s=serial('COM13', 'BaudRate', 9600, 'StopBits', 2);
while state<2000
    center=0;
    count=0;
    count1=0;
    data = getsnapshot(vid);
    imshow(data);
    for i=1:240
        for j=1:320
            if (data(i,j,1)>200 && data(i,j,2)<100 && data(i,j,3)<100)    %this calculates the average red pixel cordinates.
                count=count+1;
                center=center+j;                                          
            end
            if(i>220 && data(i,j,1)>180 && data(i,j,2)<100 && data(i,j,3)<100)
                count1=count1+1;
            end
        end        
    end
    count
    center=center/count
    fopen(s);
    if(count1>20)                   %this  decides if red has reached towards the bottom of  the image. If it is then it stops as now we are closer to the red spot.
        fwrite(s,'s');
        break;
    else
        if(count > 20)                   
        if(center < 150)    
            fwrite(s,'l');
        elseif(center > 200)
            fwrite(s,'r');
        else
            fwrite(s,'f');
        end
        elseif(count<=20)
            fwrite(s,'l');
        end
        state=state+1;
    end
    fclose(s);
end
fopen(s);
fwrite(s,'s');
fclose(s);
delete(vid);
end