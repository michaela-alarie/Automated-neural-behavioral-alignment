% Michaela Alarie
% Updated: July 18, 2023
%{
Example script for aligning identified TS pulses with (1) task computer
events, (2) event times logged by the NeuroOmega, and (3) transcutaneous
stimulation times logged by the NeuroOmega. This was repeated for DBS ON
and OFF conditions. 

Individual functions throughout the script describe inputs and outputs
%}

clear; close all;

load('AOSamplingRate.mat')
%% Align DBS ON Data
DBSON=struct;
load('DBSONPercept.mat');
neuralData_DBSON=data;

t=((1:length(neuralData_DBSON(1).TimeDomainData))-1)/250; % time vector
[DBSON.TaskEventErr, DBSON.itP, DBSON.dPpks, DBSON.bp, DBSON.rectified, DBSON.mvgngAvg, DBSON.appl_thresh, DBSON.starttimes]= ...
    alignCutStimMarkers(t, neuralData_DBSON(1).TimeDomainData, 70, 90, 'DBSONBehavior.mat', 10);

% Compare Identified Artifact Times to AO Logged Event Times
[DBSON.AONines_Sec, DBSON.AOEventError_ms]=findAOEventLatency('DBSON_AOLoggedEvents.mat', CStimMarker_1_KHz, t, DBSON.itP);

% Compare Identified Artifact Times to AO Logged Transcutaneous Stim Times
[DBSON.AOStimStartTimes_Sec,DBSON.AOStimError_ms]=findAOStimLatency('DBSON_AOLoggedTS.mat', CStimMarker_1_KHz, t, DBSON.itP);

%% Align DBS OFF Data
DBSOFF=struct;
load('DBSOFFPercept.mat');
neuralData_DBSOFF=data;

t=((1:length(neuralData_DBSOFF(3).TimeDomainData))-1)/250;
[DBSOFF.TaskEventErr, DBSOFF.itP, DBSOFF.dPpks, DBSOFF.bp, DBSOFF.rectified, DBSOFF.mvgngAvg, DBSOFF.appl_thresh, DBSOFF.starttimes]= ...
    alignCutStimMarkers(t, neuralData_DBSOFF(3).TimeDomainData, 79.5, 80.5, 'DBSOFFBehavior.mat', 10);

% Compare Identified Artifact Times to AO Logged Event Times
[DBSOFF.AONines_Sec, DBSOFF.AOEventError_ms]=findAOEventLatency('DBSOFF_AOLoggedEvents.mat', CStimMarker_1_KHz, t, DBSOFF.itP);

% Compare Identified Artifact Times to AO Logged Transcutaneous Stim Times
[DBSOFF.AOStimStartTimes_Sec,DBSOFF.AOStimError_ms]=findAOStimLatency('DBSOFF_AOLoggedTS.mat', CStimMarker_1_KHz, t, DBSOFF.itP);

%% Plot
% Not a lot of data points currently so histogram will look a bit strange
%AO Events
figure(1)
subplot(121)
histogram(DBSON.AOEventError_ms, 10)
subtitle('DBS ON'); xlabel('Time(ms)'); ylim([0 4])
subplot(122)
histogram(DBSOFF.AOEventError_ms, 10)
subtitle('DBS OFF'); xlabel('Time(ms)'); ylim([0 4])
sgtitle('Latency from Identified TS to AO Event')

%AO Stim
figure(2)
subplot(121)
histogram(DBSON.AOStimError_ms, 10)
subtitle('DBS ON'); xlabel('Time(ms)'); ylim([0 4])
subplot(122)
histogram(DBSOFF.AOStimError_ms, 10)
subtitle('DBS OFF'); xlabel('Time(ms)'); ylim([0 4])
sgtitle('Latency from Identified TS to AO Stim')