%%Training
clear all;

clc;
a=dir('mfcc_train_fac_10');
mkdir('mymodels_mfcc_fac_10');
for i=3:length(a)
    i
dim=13;
centres=16;
MIX=gmm(dim,centres,'diag');
load(fullfile('mfcc_train_fac_10',a(i).name));
foptions(14)=1;
foptions(3)=0.1;
MIX=gmminit(MIX,y1,foptions);
MIX.priors
OPTIONS(1)=1;
OPTIONS(3)=0.1;
OPTIONS(5)=1;
OPTIONS(14)=100;
[MIX,OPTIONS,ERRLOG]=gmmem(MIX,y1,OPTIONS);
save(fullfile('mymodels_mfcc_fac_10',a(i).name),'MIX');
clear y1 MIX;
end;


 
