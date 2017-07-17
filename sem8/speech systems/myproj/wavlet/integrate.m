% combining test cases from testwavedata and trainwavedata folders to timitdata
clear all;
clc;
mkdir('timitdata_fac_10');
allspk=dir('timitdata_fac_10/*');
tr_data  = dir('trainwavdata_fac_10');
tst_data = dir('testwavdata_fac_10');
for i=3:length(tr_data)
    i
    str=tr_data(i).name;
    mkdir(fullfile('timitdata_fac_10',str));
    wav_train =dir(fullfile('trainwavdata_fac_10',tr_data(i).name,'*.wav'));
    wav_test = dir(fullfile('testwavdata_fac_10',tst_data(i).name,'*.wav'));
    for j=1:length(wav_train)   
        copyfile((fullfile('trainwavdata_fac_10',tr_data(i).name,wav_train(j).name)),(fullfile('timitdata_fac_10',str,sprintf('%d.wav',j))),'f');
    end;
    for j=1:length(wav_test)
    copyfile((fullfile('testwavdata_fac_10',tr_data(i).name,wav_test(j).name)),(fullfile('timitdata_fac_10',tr_data(i).name,wav_test(j).name)),'f');
    end;    
end;
