clear all;
clc;
%a=dir('allcleanmodels_16/*.mat');
%b=dir('spkrverifydata_mat/*');
threshold = 4218.2;
tpr = 0;
tnr = 0;
fpr = 0;
fnr = 0;
y1 = 0;
f1 = 'null';
p1 = 'null';
f2 = 'null';
p2 = 'null';
      [y1,f2,p2,f1,p1] = mygui_spkr();
 %     load(fullfile(p1,f1));
%        if size(y1,1)> 0
%            msgbox('model loaded successfully');
%        else
%            msgbox('error loading model');
%        end
       
%      c=dir(fullfile('spkrverifydata_mat',b(i).name,'*.mat'));
%      load(fullfile('allcleanmodels_16',strcat(b(i).name,'.mat')));
%      % claimed speaker = b(i).name;
%       %   load(fullfile('spkrverifydata_mat',b(i).name,c(j).name));
 %        verification = zeros(2,1);
 %         verification(1) = mean(log(gmmprob(MIX,y1))/length(y1));
%         for k=1:length(a)
 %             if(~strcmp(strcat(b(i).name,'.mat'),a(k).name))
%                 load(fullfile('allcleanmodels_16',a(k).name));
%                 verification(2) = verification(2) + mean(log(gmmprob(MIX,y1)/(length(b)-3)));
%              end
%         end
%         tilda = verification(1)-verification(2);
%         if j==1
%             if tilda > threshold
%                 tpr = tpr+1;
%             else
%                 fnr = fnr+1;
%             end
%         end
%         if j==2
%             if tilda > threshold
%                 fpr = fpr+1;
%             else
%                 tnr = tnr+1;
%             end
%         end
%         clear y1;
%      end
%      clear MIX;
%  end     