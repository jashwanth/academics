clear all;
clc;
a=dir('mymodels_mfcc_fac_10/*.mat');
%mkdir('spkrverifydata_mat_mfcc_fac_10_2+3-');
b=dir('spkrverifydata_mat_mfcc_fac_10_2+3-/*');
%threshold = 4218.2;
%threshold = 3773.9 %car_10 mfcc
%threshold = 3955.1 %car_10_2+3- mfcc
%threshold = 3698.7 %fac_10_2+3- mfcc
%threshold = 3585.3 %fac mfcc
%threshold = 3699.2 %fac 10 mfcc
threshold = 4004 %fac 10 mfcc
tpr = 0;
tnr = 0;
fpr = 0;
fnr = 0;
 for i=3:length(b)
     i
     c=dir(fullfile('spkrverifydata_mat_mfcc_fac_10_2+3-',b(i).name,'*.mat'));
     load(fullfile('mymodels_mfcc_fac_10',strcat(b(i).name,'.mat')));
     % claimed speaker = b(i).name;
     for j=1:length(c)
         load(fullfile('spkrverifydata_mat_mfcc_fac_10_2+3-',b(i).name,c(j).name));
         verification = zeros(2,1);
         verification(1) = mean(log(gmmprob(MIX,y1))/length(y1));
        for k=1:length(a)
             if(~strcmp(strcat(b(i).name,'.mat'),a(k).name))
                load(fullfile('mymodels_mfcc_fac_10',a(k).name));
                verification(2) = verification(2) + mean(log(gmmprob(MIX,y1)/(length(b)-3)));
             end
        end
        tilda = verification(1)-verification(2);
        if j<3
            if tilda > threshold
                tpr = tpr+1;
            else
                fpr = fpr+1;
            end
        else
            if tilda > threshold
                tnr = tnr+1;
            else
                fnr = fnr+1;
            end
        end
        clear y1;
     end
     clear MIX;
 end     