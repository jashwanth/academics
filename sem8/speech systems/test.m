function jashwanth()
% svlsat - Speech and Vision Lab. Speech Analysis Toolbox

    global svlrec svlplay;
    global fhandle hpop ngdfig hfs hsnr;
    global s fs prfs;
    global FileId;
    global ngdflag;       
    global xloc xloch;
    global gci zfs vnv;
    global snr;

    % Add paths
    pdir=pwd; addpath([pdir '/matlib/']);addpath([pdir '/matlib/playrec_2_1_1']);
	addpath([pdir '/matlib/sree_pe']);
    addpath(genpath('./'));
    
     createmaingui();

    %initsvlsat();
   % Initialize global variables
    %function initsvlsat()
        fs=16000;
        s=zeros(fs,1);        
        t=[1:length(s)]/fs;
        figure(fhandle);plot(t,s);xlim([t(1) t(end)]);ylim([-1 1]);
        svlrec=audiorecorder(fs,16,1);
        svlplay=audioplayer(s,fs,16);
        snr=9999;
    %return;
        
   %  Callbacks for simple_gui. These callbacks automatically
   %  have access to component handles and initialized data 
   %  because they are nested at a lower level.
  
   % Push button callbacks. Each callback plots current_data in
   % the specified plot type.
 
   function recbutton_Callback(source,eventdata)
       prfs=48000;
%       rec(0,1,fhandle);      
%       rec(4,1,fhandle);      
       rec(1,1,fhandle);      
   end

   function playbutton_Callback(source,eventdata) 
       if(isplaying(svlplay))
           stop(svlplay);
       end
       t=[1:length(s)]/fs;
       figure(fhandle);xlim([t(1) t(end)]);ylim([min(s) max(s)]);
       
       x=s/max(abs(s));
       svlplay=audioplayer(x,fs,16);
       play(svlplay);
   end
 
    function stopbutton_Callback(source,eventdata) 
        if(playrec('isInitialised'))
           %playrec('pause');
           %pause(1);
           playrec('reset');
        end
        s = s - mean(s);
        if(fs ~= prfs)
            s=resample(double(s),fs,prfs);
        end
        t=[1:length(s)]/fs;
        figure(fhandle);hold off;plot(t,s);ylim([min(s) max(s)]);xlim([t(1) t(end)]);
        FileId='svlpe';
        wavwrite(s,fs,16,[FileId '.wav']);
        newsignalreset();
        if(exist('./phnEngine/speech.wav'))
            system(['rm -f ./phnEngine/speech.*']);
        end
   end
   
   function openbutton_Callback(source,eventdata)
       
       [FileName,PathName] = uigetfile('*.wav','Select the wav file');
       fname=[PathName '/' FileName];
       
       fileid=FileName(1:end-4);       
       wavpos=strfind(PathName,'/wav');
       if(length(wavpos)>0)
           fpath=PathName(1:wavpos(end));
           txtfile=[fpath '/txt/' fileid '.txt'];
           sylfile=[fpath '/syl/' fileid '.syl'];
           if(exist(sylfile))
               system(['cp ' sylfile ' ./phnEngine/speech.syl']);
               system(['chmod 644 ./phnEngine/speech.syl']);
               if(exist(txtfile))
                   %system(['cp ' txtfile ' ./phnEngine/speech.txt']);
                   system(['cat ' txtfile]);
                   system(['echo 1 `tail -1 ' sylfile '|cut -d" " -f2` `sed "s/ /_/g" ' txtfile '` > ./phnEngine/speech.txt']);
               else
                   system(['rm -f ./phnEngine/speech.txt']);
               end
           else
               system(['rm -f ./phnEngine/speech.syl']);
           end
       else
           system(['rm -f ./phnEngine/speech.txt']);
           system(['rm -f ./phnEngine/speech.syl']);
       end

       disp(fname);

       fid=fopen(fname,'r');
       ftype=fgets(fid,4);
       switch ftype
           case {'nist','NIST'}
               [s,fs]=readsph(fname);
           case {'riff','RIFF'}
               [s,fs]=wavread(fname);
           otherwise
               disp('Error: Unknown format or file type');
       end
              
       s=s-mean(s);

        %%%%%%%%%%%%
        % Add noise to the signal

        if(exist('snr') & snr < 100 & snr > -50)
            s = addnoise(s,fs,snr);
        end

       t=[1:length(s)]/fs;
       figure(fhandle);hold off;plot(t,s);xlim([t(1) t(end)]);ylim([min(s) max(s)]);
       FileId='svlpe';
       wavwrite(s,fs,16,[FileId '.wav']);       

       newsignalreset();
       
   end

   function newsignalreset()
       clear zfs gci xloc xloch vnv ngdfig;
       ngdflag=0;
   end

   function savebutton_Callback(source,eventdata)
       [FileName,PathName] = uiputfile('*.wav');
       fname=[PathName '/' FileName];
       disp(fname);
       wavwrite(s,fs,16,fname);
   end

   function ngdbutton_Callback(source,eventdata)
       NGD3DFLAG=0;
       s=s(:);
       %ds=[0;diff(s)];
       %ak=1;bk=[1 1 -1 -1];
       %ak=1;bk=[1 0 -1];
       %ak=1;bk=[1 0 -0.9801];
       %ak=1;bk=[1 2 1];
       %ak=1;bk=[1 .5 -.5];
       %ak=1;bk=[1 1];
       %ak=1;bk=[1 0.99];
       ak=1;bk=[1 -1];
       %ak=1;bk=[1 -0.99];
       %ak=1;bk=1;

       ds=preempfilter(s,ak,bk);
             
       n1ms=round(fs/1000);
       
       %size(vnv)
       if(~exist('vnv'))
           vnv = vnvseg(s,fs,10);
       end
       
       % Get the nearest GCI location
       if(~exist('gci') | length(gci)==0)
            if(~exist('zfs') | length(zfs)==0)
               zfs=zfsig(s,fs);
            end
            gci=find(diff((zfs>0))==1); % -ve ZCs
            gci=gci(2:end-1);

            vgcindx=find(vnv(gci));
            vgci=gci(vgcindx); % GCIs in voiced region
            vgci=vgci(:);

            nvgcistep=5*n1ms;Ns=length(s);
            nvgci=nvgcistep+1:nvgcistep:Ns-nvgcistep;
            nvsig=(~vnv);
            nvgci=nvgci(find(nvsig(nvgci)));
            nvgci=nvgci(:);

            gci=sort([vgci;nvgci]);
            
            t=[1:length(s)]/fs;
            figure(fhandle);hold on;stem(gci/fs,ones(size(gci))*max(s),'c');plot(t,vnv*max(s)*.9,'k');
       end
  
       % Get the xloc from user through mouse click
       [xloc,yloc]=ginput(1);
       
       [mval,mndx]=min(abs(gci-round(xloc*fs)));
       xloc=gci(mndx)/fs;
       
       % Mark the selected gci (xloc) on the figure
       if(ngdflag==1)
           set(xloch,'xdata',[xloc,xloc]);
       else
           xloch=line([xloc,xloc],[min(s) max(s)],'color','r');
           ngdflag=1;
       end       
              
       % Compute NGD spectrum for a segment of differenced speech starting
       % from xloc (nearest GCI) to next GCI.
       nfft=2^13;npeaks=1;m=2;r=0.96;
       nmax=round(12*fs/1000);
       nbeg=gci(mndx);
       if(vnv(gci(mndx)))
           nend=min( gci(mndx+1)-1, nbeg+nmax );
       else
           nend=nbeg+5*n1ms-1;
       end
       
       x=ds(nbeg:nend);
       nx=length(x);    
       
       fmin=0;fmax=1000;%fs/2;
       [drf,drs,ngd,fgd,gd]= dominantresonance(x,fs,npeaks,nfft,m,r,fmin,fmax);

       %%%%% Only for plotting
       [rxw,rx,wt]=ngdpreprocess(x,m,r);       

       nx=length(rx);
       figure;clear ax;
       subplot(3,1,1);plot([1:nx]/fs*1000,rxw);hold on;plot([1:nx]/fs*1000,rx,'r');plot([1:nx]/fs*1000,wt,'g');xlabel('ms');
       ax(1)=subplot(3,1,2);plot(fgd,gd);xlabel('Hz');%hold on;stem(drf([1 1],:),drs([1 1],:));
       ax(2)=subplot(3,1,3);plot(fgd,ngd);hold on;stem(drf([1 1],:),drs([1 1],:));xlabel('Hz');
       linkaxes(ax,'x');
       
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       % Plot for frication det paper
%        fig=figure;clear ax;xend=5;dx=.1;
%        ax(1)=subplot(3,1,1);plot([0:nx-1]/fs*1000,x,'linewidth',2);text(xend+dx,0,'(a)');
%        ax(2)=subplot(3,1,2);plot([0:nx-1]/fs*1000,rx,'linewidth',2);hold on;plot([0:nx-1]/fs*1000,wt,'r--','linewidth',2);text(xend+dx,0,'(b)');
%        ax(3)=subplot(3,1,3);plot([0:nx-1]/fs*1000,rxw,'linewidth',2);xlabel('Time (msec)');text(xend+dx,0,'(c)');
%        for i=1:2
%     set(ax(i),'xticklabel',[]);
% end
% allText   = findall(fig, 'type', 'text');
% allAxes   = findall(fig, 'type', 'axes');
% allFont   = [allText; allAxes];
% set(allFont,'FontSize',14);
% 
%     saveas(fig,'wtfn.fig');
%     saveas(fig,'wtfn.pdf');
%     print(fig,'wtfn.eps','-deps2c');
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%       ngdtest(x,fs,nfft);
       
       %%%%%% 3-Dimensional NGD spectrum around the current GCI location
       if(NGD3DFLAG==1)
           if(~exist('ngdfig'))
               ngdfig=figure;
           end
           ngdfig=ngd3dplot(ds,fs,gci,mndx,npeaks,2^13,m,r,fmin,fmax,ngdfig);
       end    
   end


   function fstext_Callback(source,eventdata)
      fsstr=get(hfs,'String');
      fs=str2num(fsstr);
      disp(['Sampling rate: fs = ' num2str(fs)]);
      if(fs < 8000 || fs>96000)
          msgbox('Sampling rate should be in the range of 8000 to 96000 Hz','warn','warn');
      else
          svlrec=audiorecorder(fs,16,1);
      end
   end

   function snrtext_Callback(source,eventdata)
      snrstr=get(hsnr,'String');
      snr=str2num(snrstr);
      disp(['SNR (in dB) = ' num2str(snr)]);
      if(snr > 100 | snr < -20)
          msgbox('SNR range allowed is -20 dB to 100 dB');
          snr=9999; %max(min(snr,100),-20);
          set(hsnr,'String',snr);
      end
   end

   function popupmenu_Callback(source,eventdata)
        action = get(hpop,'Value');
        actionset = get(hpop,'String');
        
        switch(lower(char(actionset(action))))
            
            %% Audio Search
            
            case {'audio search'}
                disp(actionset(action));
                [wav fs]=wavread('svlpe.wav');
                wav=resample(wav,8000,fs);
                cd phnEngine    
                wavwrite(wav/max(abs(wav))/1.001, 8000, 16, 'speech.wav');	
                [status result]=system('./phnEngine.sh');
                cd ..
                
                result
                result2 = regexp(result,'[\f\n\r]','split');
                for l = 1:length(result2)
                    if(length(result2{l}) ~= 0)
                        sylSeq = result2{l}
                        break;
                    end
                end
                syls = strsplit(sylSeq,' ');
                fid_uni = fopen('query_unigram.syl','w');                        
                fid_bi = fopen('query_bigram.syl','w');       
                fid_finalResult = fopen('query_results_final.txt','w');
                fprintf(fid_uni,'%s',sylSeq);
                fprintf(fid_finalResult,'Query syllable sequence: %s\n\nResults:\n',sylSeq);
                for l = 1:length(syls)-1                
                    fprintf(fid_bi,'%s_%s ',syls{l},syls{l+1});
                end
                fclose(fid_uni);
                fclose(fid_bi);
                fclose(fid_finalResult);
                
                rootDir = pwd;
                binDir = strcat(rootDir,'/LuceneIndexing/bin');
                luceneJarDir = strcat(rootDir,'/LuceneIndexing/src/lucene-core-3.0.3.jar');
                javaParam = strcat(binDir,':',luceneJarDir);
                
                cd LuceneIndexing/src/
                %system(['javac -cp lucene-core-3.0.3.jar RetrievalSylIndex.java']);
                
                %system(['java -classpath /home/kalman/basil/Desktop/SyllableRecognitionSearch/LuceneIndexing/bin:/home/kalman/basil/Desktop/SyllableRecognitionSearch/LuceneIndexing/src/lucene-core-3.0.3.jar RetrievalSylIndex']);
                %system(['java -classpath ' javaParam ' RetrievalSylIndex']);
                %system(['java -classpath /home/markov/workspace/SyllableIndexTest/bin:/home/markov/SyllableRecognitionSearch/LuceneIndexing/src/lucene-core-3.0.3.jar RetrievalSylIndex']);
                
                system(['/usr/lib/jvm/java-6-openjdk/bin/java -Dfile.encoding=UTF-8 -classpath /home/vlab/SyllableRecognitionSearch/LuceneWorkspace/SyllableIndexing/bin:/home/vlab/SyllableRecognitionSearch/LuceneWorkspace/lucene-core-3.0.3.jar RetrievalSylIndex']);
                cd ../..
                
                dbWavPath = strcat(pwd,'/DB_IITM_wav');
                dbSylpath = strcat(pwd,'/DB_IITM_syl');
                nResults = 50;
                finalResult = write_results('query_result.txt',dbWavPath,dbSylpath,'query_results_final.txt',nResults);                                    
                %system(['gedit query_results_final.txt']);                
                
                [silenceWav fs_s bps_s] = wavread('silence.wav');
                cd TopResults
                resultList = dir('.'); resultList = resultList(3:end);
                
                Nplay=5;
                playCount=0;
                i=0;                
                while(playCount<Nplay)
                    i=i+1;
                    wavName = sprintf('%d.wav',i);
                    if(exist(wavName))
                        playCount=playCount+1;
                        [resWav resFs resBps] = wavread(wavName);
                        resX=resWav/max(abs(resWav));
                        sound(resX,resFs);
                        sound(silenceWav,fs_s);
                    end
%                     %                     
                end
                cd ..           
            
            
            %%
            
            case {'phonetic engine'}
                disp(actionset(action));
                [wav fs]=wavread('svlpe.wav');
                wav=resample(wav,8000,fs);
                cd phnEngine    
                wavwrite(wav/max(abs(wav))/1.001, 8000, 16, 'speech.wav');	
                [status result]=system('./Full_set_phnEngine.sh');
                result
                cd ..		

            case {'vnv analysis'}
                disp(actionset(action));
                vnvanalysis(s,fs,FileId);
                
            case {'zf analysis'}                
                disp(actionset(action));
                zfanalysis(s,fs,FileId);

            case {'voice bar analysis'}
                disp(actionset(action));
                vbar(s,fs);

            case {'frication analysis'}
                disp(actionset(action));
                fricationanalysis(s,fs,FileId,snr);

            case {'nasal murmur analysis'}
                disp(actionset(action));
                nasalanalysis(s,fs,FileId);
                
            case {'landmark detection'}
                disp(actionset(action));
                landmarkdet(s,fs,FileId);

            case {'acoustic-phonetic analysis'}
                disp(actionset(action));
                acousticphonetic(s,fs,snr,FileId);
                
            case {'glottal stop ana'}
                disp(actionset(action));
                glottalStops(s,fs);
      
            case {'dtft analysis'}
                disp(actionset(action));
                new3dplot(s,fs);
                
            case {'sonorant silence segmentation'}
                disp(actionset(action));
                son_sil_seg(s,fs);
                                
            case {'manner classes'}
                disp(actionset(action));
                classes_generate(s,fs);
                
            case {'cv spotting'}
                disp(actionset(action));
                pdir=pwd;
                cd('PhoneticEngineDemo-v2');
                pwd
                %unix(['sox -t ossdsp -s -w -r 8000 /dev/dsp2 inpututterance.wav trim 0 3']);
                %[s,fs]=wavread('inpututterance.wav');
                wavwrite(s,fs,16,'inpututterance.wav');
                unix('sox inpututterance.wav inpututterance.raw');
                unix('./shellscripts/PhoneticEngineMain.bat');
                plothypothesizedcvs;
                cd(pdir);
                
            case {'testing'}
                disp(actionset(action));
                testing(s,fs,FileId);
            %sree start    
            case {'pe1'}
                disp(actionset(action));
                [wav fs]=wavread('svlpe.wav');
%                 addpath('/matlib/sree_pe');
                pe2(wav,fs);
            %sree end
	    otherwise
                disp('Unknown action...');
        end
    end
  
function createmaingui()
   %  Create and then hide the GUI as it is being constructed.
   fhandle = figure('Visible','on','Position',[360,500,800,300]);
 
   %  Construct the components.
   xcur=10;ycur=260;xwidth=50;yheight=20;xbuff=10;
   hrec = uicontrol('Style','pushbutton','String','Rec',...
          'Position',[xcur,ycur,xwidth,yheight],...
          'Callback',{@recbutton_Callback});
   xcur=xcur+xwidth+xbuff;
   hplay = uicontrol('Style','pushbutton','String','Play',...
          'Position',[xcur,ycur,xwidth,yheight],...
          'Callback',{@playbutton_Callback});
   xcur=xcur+xwidth+xbuff;
   hstop = uicontrol('Style','pushbutton',...
          'String','Stop',...
          'Position',[xcur,ycur,xwidth,yheight],...
          'Callback',{@stopbutton_Callback});
   xcur=xcur+xwidth+xbuff;
   hopen = uicontrol('Style','pushbutton','String','Open',...
          'Position',[xcur,ycur,xwidth,yheight],...
          'Callback',{@openbutton_Callback});
   xcur=xcur+xwidth+xbuff;
   hsave = uicontrol('Style','pushbutton','String','Save',...
          'Position',[xcur,ycur,xwidth,yheight],...
          'Callback',{@savebutton_Callback});
   xcur=xcur+xwidth+xbuff;xwidth=150;
   hpop = uicontrol('Style','popupmenu',...
           'String',{'Select Choice','Audio Search','Phonetic Engine','Acoustic-Phonetic Analysis','VNV Analysis','ZF Analysis','Voice Bar Analysis','Frication Analysis',...
           'Nasal Murmur Analysis','Landmark Detection','DTFT Analysis','Testing','pe1','Sonorant Silence Segmentation','Manner Classes'},...
           'Position',[xcur,ycur,xwidth,yheight],...
           'Callback',{@popupmenu_Callback});
   xcur=xcur+xwidth+xbuff;xwidth=60;
   hfslab=uicontrol('Style','text','Position',[xcur,ycur+yheight,xwidth,yheight],...
       'String','Fs (Hz)');
   hfs = uicontrol('Style','edit',...
	   'Position',[xcur,ycur,xwidth,yheight],'String',16000,...
	   'Callback',{@fstext_Callback});
   xcur=xcur+xwidth+xbuff;xwidth=60;
   hsnrlab=uicontrol('Style','text','Position',[xcur,ycur+yheight,xwidth,yheight],...
       'String','SNR (dB)');
   hsnr = uicontrol('Style','edit',...
	   'Position',[xcur,ycur,xwidth,yheight],'String',9999,...
	   'Callback',{@snrtext_Callback});  
   xcur=xcur+xwidth+xbuff;xwidth=50;
    hngd = uicontrol('Style','pushbutton','String','NGD',...
          'Position',[xcur,ycur,xwidth,yheight],...
          'Callback',{@ngdbutton_Callback});

   ha = axes('Units','Pixels','Position',[50,60,700,185]);
   align([hrec,hplay,hstop,hopen,hsave,hpop,hfslab,hfs,hsnrlab,hsnr,hngd],'Top','None');
  
   % Initialize the GUI.
   % Change units to normalized so components resize 
   % automatically.
   set([fhandle,ha,hrec,hplay,hstop,hopen,hsave,hpop,hfslab,hfs,hsnrlab,hsnr,hngd],...
   'Units','normalized');
   % Assign the GUI a name to appear in the window title.
   set(fhandle,'Name','speaker verification');
   % Move the GUI to the center of the screen.
   movegui(fhandle,'center')
   % Make the GUI visible.
   set(fhandle,'Visible','on');
end

end

                
