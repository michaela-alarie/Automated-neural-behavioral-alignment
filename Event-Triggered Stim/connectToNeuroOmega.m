function connectToNeuroOmega(DSPMac)
% Michaela Alarie
% Updated: July 17, 2023

%%% Usage:
%{
Establishes ethernet connection to the NeuroOmega system 
%}
%%% Inputs:
% DSPMac: Mac address of the NeuroOmega

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add MATLAB SDK to path
addpath(genpath('C:\Program Files (x86)\AlphaOmega\Neuro Omega System SDK\MATLAB_SDK'))

% connect to AO
AO_DefaultStartConnection(DSPMac);

% check if AO is connected
for j=1:100
    pause(1);
    ret=AO_IsConnected;
    if ret==1
        disp('The System is Connected')
        break;
    else
        disp('System not connected, checking again')
    end
end

%% Manual Stimulation Testing
%{
This information is also documented in the NeuroOmega manual
%% Inputs
% StimChannel: Stim channel 
% FirstPhaseDelay_mS: First phase delay (ms)
% FirstPhaseAmpl_mA: First phase amplitude (mA)
% FirstPhaseWidth_mS: First pulse width (ms)
% SecondPhaseDelay_mS: Second phase delay (ms)
% SecondPhaseAmpl_mA: Second phase amplitude (mA)
% SecondPhaseWidth_mS: Second pulse width (ms)
% Freq_hZ: Stimulation Frequench (Hz)
% Duration_sec: length of stimulation (s)
% ReturnChannel: Return channel (-1 would be global return but otherwise
can set a specific channel)

%% Code
AO_StartDigitalStimulation(StimChannel, FirstPhaseDelay_mS, FirstPhaseAmpl_mA,...
FirstPhaseWidth_mS, SecondPhaseDelay_mS, SecondPhaseAmpl_mA,SecondPhaseWidth_mS,...
 Freq_hZ, Duration_sec, ReturnChannel);
%}
end