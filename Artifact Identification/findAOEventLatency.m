function [AONines_Sec,AOEventError_ms]=findAOEventLatency(file,samplingRate, t, itP)
% Michaela Alarie
% Updated July 18, 2023
%%% Usage
% Compares previously identified times (see alignCutStimMarkers.m) of TS
% identified in device LFPs with Event trial start times logged by the NeuroOmega
% (Alpha Omega, Nazareth, Israel).
%%% Inputs
% file: NeuroOmega file to load. For this function you specifically care
    % about "CPORT__1" variable saved by the neurOmega because as this will 
    % be the logged event times from Port 1 of the NeuroOmega system.
% samplingRate: NeuroOmega sampling rate (kHz)
% t: LFP time vector from implantable DBS device
% itP: identified TS times from device LFPs
%%% Outputs
% AONines_Sec: Trial start times (s) logged by the AO
% AOEventError_ms:Error (ms) between start times logged by the AO and TS times

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load(file)
AONinesLocs=find(CPORT__1(2,:)==9);
AONines=CPORT__1(1,AONinesLocs);
AONines_Sec=(AONines-min(AONines))/(samplingRate*1000);
AOEventError=AONines_Sec-(t(itP)-min(t(itP))); % find error between AO Logged event and identified TS
AOEventError_ms=AOEventError*1000; %convert to ms
end