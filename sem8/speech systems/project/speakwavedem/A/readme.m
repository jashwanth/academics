% In order to launch the code just do the following steps:
% 
% - run Matlab
% - unzip all files in Matlab current directory (C:/..../Matlab/work is the default directory)
% - type the name of main function ("wavespeak") on Matlab command window (the white window)
% - now a simple and intuitive GUI should appear
%
%
% FUNCTIONS
%
% Select sound from disk:                         read the input sound from disk
%
% Select sound from microphone:                   read the input sound from microphone
%
% Add selected sound to database:                 the input sound is added to database and will be used for training
%
% Database Info:                                  show informations about the sounds present in database.
%
% Speaker Recognition:                            speaker recognition. The selected input sound is processed
%
% Delete Database:                                remove database from the current directory
%
% Features extraction:                            extract features from selected sound
%
% Program info:                                   show informations about this software
%
%
% Source code for Wavelet Speaker Recognition:
%                                                 how to obtain the complete source code
%
% Exit:                                           quit program
%
%
%
% 
% First, select an input image clicking on "Select sound from disk".
% Then you can
%   - add this sound to database (click on "Add selected sound to database"
%   - perform speaker recognition (click on "Speaker Recognition" button)
%     Note: If you want to perform speaker recognition database has to include 
%     at least one sound.
%  If you choose to add selected sound to database, a positive integer (speaker ID) is
%  required. This posivive integer is a progressive number which identifies
%  a speaker (each speaker corresponds to a class).
%
% For example:
%  - run the GUI (type "wavespeak" on Matlab command window)
%  - delete database (click on "Delete Database")
%  - add "mike1.jpg" to database ---> the ID has to be 1 since Mike is the first
%    person you are adding to database
%  - add "mike2.jpg" to database ---> the ID has to be 1 since you have already
%    added a Mike's voice to database
%  - add "paul1.jpg" to database ---> the ID has to be 2 since Paul is the second person
%    you are adding to database
%  - add "cindy1.jpg" to database ---> the ID has to be 3 since Cindy is
%    the third person you are adding to database
%  - add "paul2.jpg" to database ---> the ID has to be 2 once again since
%    you have already added Paul to database
%   
% ... and so on! Very simple, isnt't? :)
% 
% The recognition gives as results the ID of nearest speaker present in
% database. For example if you select image "paul3.jpg" the ID given SHOULD
% be 2: "it should be" because errors are possible.
% 
% 
% 
% Luigi ROSA
% Via Centrale 35
% 67042 Civita di Bagno
% L'Aquila - ITALY
% mobile +39 3207214179
% email luigi.rosa@tiscali.it
% website http://www.advancedsourcecode.com
% 
