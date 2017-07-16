%clear all;
%close all;
vid = videoinput('winvideo', 1);
set(vid,'ReturnedColorSpace','rgb');
%imaqhwinfo('winvideo',1,'rgb_1600x1200');
%imread(bot);
%for i=1:1200
%    for j=1:1600
 %       bot(i,j,2)
  %  end
%end
preview(vid);
for i=1:10000
    for j=1:10000
    end
end
bot = getsnapshot(vid);
%bot
name1= 'red';
name2='green';
name3='blue';
state1=0
state2=0;
state3=0;
for i=1:1000
    for j=1:700
        if(bot(i,j,1)>130 && bot(i,j,2)<100 && bot(i,j,3)<100)
            state1 = state1+1;
        end
        if(bot(i,j,1)<100 && bot(i,j,2)>130 && bot(i,j,3)<100)
            state2 = state2+1;
        end
        if(bot(i,j,1)<100 && bot(i,j,2)<100 && bot(i,j,3)>130)
            state3 = state3+1;
        end
    end
end
fprintf('%d %d %d\n',state1,state2,state3);
if(state1 > state2 && state1 > state3)
    fprintf('color is %s\n',name1);
end
if(state2 > state1 && state2 > state3)
    fprintf('color is %s\n',name2);
end      
if(state3 > state1 && state3 > state2)
    fprintf('color is %s\n',name3);
end