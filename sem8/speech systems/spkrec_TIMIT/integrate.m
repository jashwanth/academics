% combining test cases from testwavedata and trainwavedata folders to timitdata
clear all;
clc;
allspk=dir('timitdata/*');
tr_data  = dir('trainwavdata');
tst_data = dir('testwavdata');
for i=3:length(tr_data)
    str=tr_data(i).name;
    mkdir(fullfile('timitdata',str));
    wav_train =dir(fullfile('trainwavdata',tr_data(i).name,'*.wav'));
    wav_test = dir(fullfile('testwavdata',tst_data(i).name,'*.wav'));
    for j=1:8   
        copyfile((fullfile('trainwavdata',tr_data(i).name,wav_train(j).name)),(fullfile('timitdata',str,sprintf('%d.wav',j))),'f');
    end;
    for j=1:2
    copyfile((fullfile('testwavdata',tr_data(i).name,wav_test(j).name)),(fullfile('timitdata',tr_data(i).name,wav_test(j).name)),'f');
    end;    
end;
