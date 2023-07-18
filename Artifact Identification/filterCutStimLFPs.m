function [bp, rectified, mvgngAvg, appl_thresh]=filterCutStimLFPs(neuralData, L, U)
% Michaela Alarie, Brown University
% Updated: July 18, 2023
%%% Usage:
%{
Filter LFPs to find TS pulses
%}
%%% Inputs:
% neuralData: data stream of interest
% L: lower filter bound
% U: upper filter bound

%%% Output
% bp: bandpassed data
% rectified: bandpass and rectified data
% mvgngAvg: data after applying bandpass, rectification, and moving average
% window of 50 samples
% appl_thresh: takes mvgngAvg and only retains values 2x above the overall
% mean of mvgngAvg, making all other values 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bandpass Filter Data (dL is the filter properties which could be made an output)
[bp, dL]=bandpass(neuralData-mean(neuralData), [L U], 250); %filter(b,a,left-mean(left));

%% Rectify
rectified=abs(bp);

%% Compute Moving Average
mvgngAvg=movmean(rectified,50);

%% Apply threshold
appl_thresh=[];
pulse_avg=mean(mvgngAvg);
for i=1:length(mvgngAvg)
    if mvgngAvg(i)<2*pulse_avg
        appl_thresh(i)=0;
    elseif mvgngAvg(i)>2*pulse_avg
        appl_thresh=[appl_thresh mvgngAvg(i)];
    end
end
end