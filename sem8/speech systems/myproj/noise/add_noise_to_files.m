
         snr=5;
		 a=dir('testwavdata/*');
    	noise=wavread('car_8k.wav');
   for i=3:length(a)
       i
       mkdir(fullfile('testwavdata_car',a(i).name));
       allwav=dir(fullfile('testwavdata',a(i).name,'*.wav'));
      
        for j=1:length(allwav)
            inFile=fullfile('testwavdata',a(i).name,allwav(j).name);
           
	[sp fs]=wavread(inFile);
%     length(sp)
%     length(noise)
	pos=abs(floor(rand(1)*(length(noise)-length(sp))));
	n=noise(pos+1:pos+length(sp));
	n=n-mean(n);
	n=n/sqrt(var(n));
	vs=var(sp);
	vn = vs/(10^(snr/10));
	n=n*sqrt(vn);
	nsp=sp+n;
	wavwrite(nsp/(max(abs(nsp)*1.01)),fs,fullfile('testwavdata_car',a(i).name,allwav(j).name));
  
        end;
   end;
