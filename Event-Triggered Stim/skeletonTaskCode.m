%{
This is a skeleton timing file for a task in MonkeyLogic (Asaad and Eskandar 2008). 
For specific details on how to build a MonkeyLogic task, visit 
https://monkeylogic.nimh.nih.gov/ 
%}

% Trial start occurs here

%% Stimulation
%{
Stimulation can be coded into any part of the task. Here is an example for
right at the trial start. Inputs to "AO_StartDigitalStimulation" need to be
updated based on stimulation parameters of interest. Also make sure to run
"connectToNeuroOmega.m" prior to starting the task.
%}

AO_StartDigitalStimulation(StimChannel, FirstPhaseDelay_mS, FirstPhaseAmpl_mA,...
FirstPhaseWidth_mS, SecondPhaseDelay_mS, SecondPhaseAmpl_mA,SecondPhaseWidth_mS,...
 Freq_hZ, Duration_sec, ReturnChannel);

%% Codes Definitions
%{
These are the event markers in the task. Trial start (9) and Trial end (18)
are automatically coded into every MonkeyLogic task at the start and end.
%}
Codes.fixationOn=20;
Codes.fixationOff=24;

%% Task Object Definitions
fixation_point = 1;

%% Example coding of fixation in MonkeyLogic
toggleobject(fixation_point, 'eventmarker', Codes.fixationOn) % turn fixation on
idle(5000) %length of time (ms) to hold fixation. Could always pre-define this earlier
toggleobject(fixation_point, 'eventmarker', Codes.fixationOff) % turn fixation off

% trial end occurs here