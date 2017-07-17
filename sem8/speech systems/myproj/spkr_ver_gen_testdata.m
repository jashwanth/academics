% file to create testcases for speaker verification system
% combining test cases from testwavedata and trainwavedata folders to timitdata
clear all;
clc;
mkdir('spkrverifydata');
%r1 = randi(10,1,10);
r1 = randi(98,1,100);
allspk=dir('timitdata/*');
for i=3:length(allspk)
    str=allspk(i).name;
    mkdir(fullfile('spkrverifydata',str));
    wav_timitdata =dir(fullfile('timitdata',str,'*.wav'));
    copyfile((fullfile('timitdata',str,wav_timitdata(5).name)),(fullfile('spkrverifydata',str,'correct.wav')),'f');
    if r1(i)~= i 
    copyfile((fullfile('timitdata',allspk(r1(i)).name,'5.wav')),(fullfile('spkrverifydata',str,'incorrect.wav')),'f');
    else
        copyfile((fullfile('timitdata',allspk(r1(i-1)).name,'5.wav')),(fullfile('spkrverifydata',str,'incorrect.wav')),'f');
    end;   
end;
