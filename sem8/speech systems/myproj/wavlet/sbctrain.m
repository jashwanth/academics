clear all;
clc;
x1=0;
a=dir('trainwavdata_fac_10/f*');
    
   for i=1:length(a)
      i       
      allwav=dir(fullfile('trainwavdata_fac_10',a(i).name,'*.wav'));
      
        for j=1:length(allwav)
            fname=fullfile('trainwavdata_fac_10',a(i).name,allwav(j).name);
           
                  [y fs]=wavread(fname);
                   clear fname;
                   sig=y.*y;
          E=mean(sig);
          Threshold=0.05*E;
          k=1;
          for b=1:100:(length(sig)-100)
              if((sum(sig(b:b+100)))/100 > Threshold)
                  dest(k:k+100)=y(b:b+100);
                  k=k+100;
              end;
          end;
          clear  FS Threshold E sig y ;
	              
                   dest=dest';
	              
                   if j==1
                       x1=dest;
                   else
                      x1=vertcat(x1,dest);
                   end;
        clear dest;
        end;
        
        y1=sbc_2(x1,8000);
        save(fullfile('sbc_train_fac_10',a(i).name),'y1');
        a(i).name
        clear y1,x1;
        
   end;
   
