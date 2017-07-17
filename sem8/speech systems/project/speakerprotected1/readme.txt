Copy all files in Matlab current directory
and type "speakerrecognition" on Matlab command 
window. 

After unzipping the file correctly, you will find two folders,
TRAIN and TEST, each contains some files,
named: S1.WAV, S2.WAV, …, ; each is labeled after the ID of the speaker.
These files were recorded in Microsoft WAV format. In Windows systems, you can
listen to the recorded sounds by double clicking into the files.


You can use the sound files present in "TRAIN" to create the database
of known speakers and use sound files present in "TEST" in order to evaluate
the automatic recognizer.

Note that sounds should have the  same sampling frequency and this value 
has to be consistent with the size of frame window: 256 samples should have a duration of
about 30 ms: this is achieved using a sampling frequency of about
12500. If this condition is not satisfied you have to re-sample input sound 
(you can use "resample" Matlab command) or, equivalently, change windowing parameters for filtering.

This code is based on Amin Koohi's excellent submission available at
http://www.mathworks.com/matlabcentral/fileexchange/loadFile.do?objectId=8802&objectType=FILE
and improves results using an advanced metric for distance computation. 
In this way a better recognition rate is achieved. 

For the complete source code please visit

http://www.advancedsourcecode.com/speaker.asp

For any question please email me luigi.rosa@tiscali.it

Luigi Rosa
Via Centrale 35
67042 Civita Di Bagno
L'Aquila - ITALY
mobile +39 3207214179
email luigi.rosa@tiscali.it
website http://www.advancedsourcecode.com


