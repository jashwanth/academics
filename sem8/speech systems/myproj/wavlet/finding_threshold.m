%% verification with GMM modelling
clear all;
clc;
a=dir('mymodels_mfcc_fac_10/*.mat');
b=dir('mfcc_test_fac_10/*');
c=dir(fullfile('mfcc_test_fac_10',b(3).name,'*.mat'));
threshold = zeros(length(a),length(c))
 for i=3:length(b)
     i
     c=dir(fullfile('mfcc_test_fac_10',b(i).name,'*.mat'));
     load(fullfile('mymodels_mfcc_fac_10',strcat(b(i).name,'.mat')));
     % claimed speaker = b(i).name;
     for j=1:length(c)
         load(fullfile('mfcc_test_fac_10',b(i).name,c(j).name));
         verification = zeros(2,1);
         verification(1) = mean(log(gmmprob(MIX,y1))/length(y1));
        for k=1:length(a)
             if(~strcmp(strcat(b(i).name,'.mat'),a(k).name))
                load(fullfile('mymodels_mfcc_fac_10',a(k).name));
                verification(2) = verification(2) + mean(log(gmmprob(MIX,y1)/(length(b)-3)));
             end
        end
        threshold(i-2,j) = verification(1)-verification(2);
        clear verification y1;
     end
 end
 
 
 %threshold = 3773.9