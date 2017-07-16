% Create WAV file in current folder.
load handel.mat
 
hfile = 'handel.wav';
wavwrite(y, Fs, hfile)
clear y Fs
 
% Read the data back into MATLAB, and listen to audio.
[y, Fs, nbits, readinfo] = wavread(hfile);
sound(y, Fs);