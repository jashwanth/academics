clear all;
clc;
a=dir('allcleanmodels_16/*.mat');
b=dir('spkrverifydata_mat/*');
threshold = 4218.2;
tpr = 0;
tnr = 0;
fpr = 0;
fnr = 0;
 for i=3:length(b)
     c=dir(fullfile('spkrverifydata_mat',b(i).name,'*.mat'));
     load(fullfile('allcleanmodels_16',strcat(b(i).name,'.mat')));
     % claimed speaker = b(i).name;
     for j=1:length(c)
         load(fullfile('spkrverifydata_mat',b(i).name,c(j).name));
         verification = zeros(2,1);
         verification(1) = mean(log(gmmprob(MIX,y1))/length(y1));
        for k=1:length(a)
             if(~strcmp(strcat(b(i).name,'.mat'),a(k).name))
                load(fullfile('allcleanmodels_16',a(k).name));
                verification(2) = verification(2) + mean(log(gmmprob(MIX,y1)/(length(b)-3)));
             end
        end
        tilda = verification(1)-verification(2);
        if j==1
            if tilda > threshold
                tpr = tpr+1;
            else
                fnr = fnr+1;
            end
        end
        if j==2
            if tilda > threshold
                fpr = fpr+1;
            else
                tnr = tnr+1;
            end
        end
        clear y1;
     end
     clear MIX;
 end     