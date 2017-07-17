%% verification with GMM modelling
clear all;
clc;
a=dir('allcleanmodels_16/*.mat');
b=dir('mfcc_test/*');
c=dir(fullfile('mfcc_test',b(3).name,'*.mat'));
threshold = zeros(length(a),length(c));
 for i=3:length(b)
     c=dir(fullfile('mfcc_test',b(i).name,'*.mat'));
     load(fullfile('allcleanmodels_16',strcat(b (i).name,'.mat')));
     % claimed speaker = b(i).name;
     for j=1:length(c)
         load(fullfile('mfcc_test',b(i).name,c(j).name));
         verification = zeros(2,1);
         verification(1) = mean(log(gmmprob(MIX,y1))/length(y1));
        for k=1:length(a)
             if(~strcmp(strcat(b(i).name,'.mat'),a(k).name))
                load(fullfile('allcleanmodels_16',a(k).name));
                verification(2) = verification(2) + mean(log(gmmprob(MIX,y1)/(length(b)-3)));
             end
        end
        threshold(i-2,j) = verification(1)-verification(2);
        clear verification y1;
     end
 end     