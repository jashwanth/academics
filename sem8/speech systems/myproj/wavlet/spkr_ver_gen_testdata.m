% file to create testcases for speaker verification system
% combining test cases from testwavedata and trainwavedata folders to timitdata_fac_10
clear all;
clc;
mkdir('spkrverifydata_fac_10_2+3-');
%r1 = randi(10,1,10);
r1 = randi([3,100],1,100);
allspk=dir('timitdata_fac_10/*');
for i=3:length(allspk)
    i
    str=allspk(i).name;
    mkdir(fullfile('spkrverifydata_fac_10_2+3-',str));
    wav_timitdata_fac_10 =dir(fullfile('timitdata_fac_10',str,'*.wav'));
    copyfile((fullfile('timitdata_fac_10',str,wav_timitdata_fac_10(8).name)),(fullfile('spkrverifydata_fac_10_2+3-',str,'correct1.wav')),'f');
    copyfile((fullfile('timitdata_fac_10',str,wav_timitdata_fac_10(9).name)),(fullfile('spkrverifydata_fac_10_2+3-',str,'correct2.wav')),'f');
    if r1(i)~= i 
    copyfile((fullfile('timitdata_fac_10',allspk(r1(i)).name,wav_timitdata_fac_10(8).name)),(fullfile('spkrverifydata_fac_10_2+3-',str,'incorrect1.wav')),'f');
    copyfile((fullfile('timitdata_fac_10',allspk(r1(i)).name,wav_timitdata_fac_10(9).name)),(fullfile('spkrverifydata_fac_10_2+3-',str,'incorrect2.wav')),'f');
    copyfile((fullfile('timitdata_fac_10',allspk(r1(i)).name,wav_timitdata_fac_10(10).name)),(fullfile('spkrverifydata_fac_10_2+3-',str,'incorrect3.wav')),'f');
    else
        copyfile((fullfile('timitdata_fac_10',allspk(r1(i-1)).name,wav_timitdata_fac_10(8).name)),(fullfile('spkrverifydata_fac_10_2+3-',str,'incorrect1.wav')),'f');
        copyfile((fullfile('timitdata_fac_10',allspk(r1(i-1)).name,wav_timitdata_fac_10(9).name)),(fullfile('spkrverifydata_fac_10_2+3-',str,'incorrect2.wav')),'f');
        copyfile((fullfile('timitdata_fac_10',allspk(r1(i-1)).name,wav_timitdata_fac_10(10).name)),(fullfile('spkrverifydata_fac_10_2+3-',str,'incorrect3.wav')),'f');
    end;   
end;
