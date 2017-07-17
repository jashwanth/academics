
a=dir('testwavdata_factory/*');
for i=3:length(a)
       mkdir(fullfile('testwavdata_factory_en',a(i).name));
       allwav=dir(fullfile('testwavdata_factory',a(i).name,'*.wav'));
      
        for j=1:length(allwav)
            inFile=fullfile('testwavdata_factory',a(i).name,allwav(j).name);
    [sp1 fs1] =wavread(inFile);
    var1  = specsubm(sp1,fs1);
    wavwrite(var1,fs1,fullfile('testwavdata_factory_en',a(i).name,allwav(j).name));
        end;
end;
