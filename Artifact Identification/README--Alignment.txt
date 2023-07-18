% Michaela Alarie
% Updated: July 18, 2023

% README for Aligning Identified TS from device LFPs to (1) task computer trial start events, 
(2) AO logged trial start events, and (3) AO logged TS.

% Data Files
    1-AOSamplingRate.mat: Sampling Rate of the NeuroOmega
    2-DBSONPercept.mat: LFPs recorded during BrainSense streaming (DBS ON)
    3-DBSONBehavior.mat: MonkeyLogic behavioral data during DBS ON
    4-DBSON_AOLoggedTS.mat: NeuroOmega TS times during DBS ON
    5-DBSON_AOLoggedEvents.mat: NeuroOmega event times (9s are the trial starts) during DBS ON
    6-DBSOFFPercept.mat: LFPs recorded during Indefinite streaming (DBS OFF)
    7-DBSOFFBehavior.mat: MonkeyLogic behavioral data during DBS OFF
    8-DBSOFF_AOLoggedTS.mat: NeuroOmega TS times during DBS OFF
    9-DBSOFF_AOLoggedEvents.mat: NeuroOmega event times (9s are the trial starts) during DBS OFF

% Functions/Scripts 
(there is a README at the top of each one that describes the script/function inputs/outputs/usage in more detail)
    1-neuralBehavioralAlignment_Example.m
        - main script for aligning identified TS from device LFPs with task
        events and transmitted TS. Utilizes the other functions in this folder

    2-findAOStimLatency.m
        - Compares identified device TS times (from LFPs) with Stimulation 
        times logged by the NeuroOmega (Alpha Omega, Nazareth, Israel)

    3-findAOEventLatency.m
        - Compares identified device TS times (from LFPs) with Event trial 
        start times logged by the NeuroOmega

    4-filterCutStimLFPs.m
        - Filter LFPs to find TS pulses. Applies bandpass, rectification,
        moving average, and thresholding.

    5-alignCutStimMarkers.m
        - Identifies TS times after filtering LFPs using function (4) above

    6-compileEventStarts.m
        - compiles trial start times from MonkeyLogic data file
        
    