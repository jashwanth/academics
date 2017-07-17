%%Training
clear all;

clc;
a=dir('sbc_train');
for i=3:length(a)
dim=12;
centres=16;
MIX=gmm(dim,centres,'diag');
load(fullfile('sbc_train',a(i).name));
foptions(14)=1;
MIX=gmminit(MIX,y1,foptions);
%MIX.priors
OPTIONS(1)=1;
OPTIONS(14)=75;
[MIX,OPTIONS,ERRLOG]=gmmem(MIX,y1,OPTIONS);
save(fullfile('allcleanmodels_16',a(i).name),'MIX');
clear y1 MIX;
end;


 
