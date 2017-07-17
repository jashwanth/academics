%to extract the sbc features of the testingdata after removing silence
clear all;
clc;
a=dir('testwavdata_fac_10/*');
mkdir('sbc_test_fac_10');
for i=3:length(a)
    allwav=dir(fullfile('testwavdata_fac_10',a(i).name,'*.wav'));
    i
    mkdir(fullfile('sbc_test_fac_10',a(i).name));
    for j=1:length(allwav)
          fname=fullfile('testwavdata_fac_10',a(i).name,allwav(j).name);
          [y,FS,FFX]=wavread(fname);
          sig=y.*y;
          E=mean(sig);
          Threshold=0.04*E;
          k=1;
          for b=1:100:(length(sig)-100)
              if((sum(sig(b:b+100)))/100 > Threshold)
                  dest(k:k+100)=y(b:b+100);
                  k=k+100;
               end;
          end;
          dest=dest';
          clear  FS FFX Threshold E sig y ;
         
  
   % clear fname dest;        
 y1=sbc_2(dest,8000);
 save(fullfile('sbc_test_fac_10',a(i).name, regexprep(allwav(j).name, '.wav', '')),'y1');
 clear y1 dest fname  ;
end;
end;
