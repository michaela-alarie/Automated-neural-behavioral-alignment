function [AOStimStartTimes_Sec,AOStimError_ms]=findAOStimLatency(file,samplingRate, t, itP)
% Michaela Alarie
% Updated July 18, 2023
%%% Usage
% Compares previously identified times (see alignCutStimMarkers.m) of TS
% identified in device LFPs with Stimulation times logged by the NeuroOmega
% (Alpha Omega, Nazareth, Israel).
%%% Inputs
% file: NeuroOmega file to load. For this function you specifically care
    % about "CStimMarker_1" variable saved by the neurOmega as this will 
    % be the logged stimulation times from the EMG/EEG headbox of the 
    % NeuroOmega system.
% samplingRate: NeuroOmega sampling rate (kHz)
% t: LFP time vector from implantable DBS device
% itP: identified TS times from device LFPs
%%% Outputs
% AOStimStartTimes_Sec: Stimulation start times (s) logged by the AO
% AOStimError_ms: Error (ms) between stimulation start times logged by the AO and TS times

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load(file)
AOStimStartLocs=diff(CStimMarker_1(1,:));
AOStimStartLoc=AOStimStartLocs-553;
AOStimStartLoc=find(AOStimStartLoc>0);
AOStimStartLoc=AOStimStartLoc+1;
AOStimStartLoc=[1,AOStimStartLoc];

AOStimStartTimes=CStimMarker_1(1,AOStimStartLoc);
AOStimStartTimes_Sec=(AOStimStartTimes-min(AOStimStartTimes))/(1000*samplingRate);
AOStimError=AOStimStartTimes_Sec-(t(itP)-min(t(itP))); % find error between AO Logged stim and identified TS
AOStimError_ms=AOStimError*1000; %convert to ms
end