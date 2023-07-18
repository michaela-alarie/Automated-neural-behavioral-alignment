function [err, itP, dPpks, bp, rectified, mvgngAvg, appl_thresh, starttimes]=alignCutStimMarkers(t, neuralData, L, U, behavioraldata, numTrials)
% Michaela Alarie, Brown University
% Updated: July 17, 2023
%%% Usage:
% Aligns identified transcutaneous stim pulses in the LFP data pulled from
% Percept with event markers created in MonkeyLogic. This was created with
% task trial starts in mind. Latencies between MonkeyLogic event markers
% and transcutaneous stim is typically larger due to latency within the
% system itself. Therefore it is best to align based on either task events 
% or stimulation times logged by the NeuroOmega. 

%%% Inputs:
% t: time vector
% neuralData: LFP data stream of interest
% behavioraldata: .mat file with task data
% L: lower bandpass filter bound
% U: upper bandpass filter bound
% numTrials: number of trials that stimulation occurred

%%% Output
% err: time difference between identified cutaneous stim pulses and task start times
% itp and dPpks: time and amplitude for each identified peak
% bp: bandpassed data
% rectified: bandpass and rectified data
% mvgngAvg: data after applying bandpass, rectification, and moving average window of 50 samples
% appl_thresh: takes mvgngAvg and only retains values 2x above the overall mean of mvgngAvg, making all other values 0
% starttimes: compiled task start times

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pull Task Start times
[starttimes]=compileEventStarts(behavioraldata, numTrials);

%% Filter data for cutaneous stim frequency
[bp, rectified, mvgngAvg, appl_thresh]=filterCutStimLFPs(neuralData, L, U);

%% Take derivative of threshold data and identify peak rise times
dP = gradient(appl_thresh, mean(diff(t)));
[dPpks,itP] = findpeaks(dP, 'MinPeakDistance',600);

if isempty(itP)==1
    itP=100;
    dPpks=100;
    disp('No cutaneous stim peaks were identified')
else
end

%% Calculate differences in alignment
if length(starttimes)==length(itP)
     err=(starttimes-starttimes(1))-(t(itP)-t(itP(1)));
else
    err=[];
    disp('Unmatched number of artifacts to starttimes')
end