%% Testing with GMM modelling
clear all;
clc;
a=dir('mymodels_wavlet_car_10/*.mat');
b=dir('sbc_test_car_10/*');
confmat=zeros(length(a)); 

 for i=3:length(b)
     i
     c=dir(fullfile('sbc_test_car_10',b(i).name,'*.mat'));
        for j=1:length(c)
            j
            load(fullfile('sbc_test_car_10',b(i).name,c(j).name));
            d=zeros(length(a),1);
                for k=1:length(a)
                      load(fullfile('mymodels_wavlet_car_10',a(k).name));
                       d(k)=mean(log(gmmprob(MIX,y1)));
                       clear MIX;
                end;
                d=d';
              ak=find(d==max(d));
              confmat(i-2,ak)=confmat(i-2,ak)+1;
            clear d y1;
          end; 
       end;
 
 
 sum=0;
%  for g=1:length(a)
%      for h=3:length(b)
%          if(g==h-2)
%              sum=sum+confmat(g,h-2);
%          end;
%      end;
%  end;
for g=1:length(a)
             sum=sum+confmat(g,g);
 end;

     percentage=(sum/(3*length(a)))*100;
     
 
 
