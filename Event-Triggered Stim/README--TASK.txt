% Michaela Alarie
% Updated: July 17, 2023

% README for triggering transcutaenous stimulation from MonkeyLogic task to
the NeuroOmega system

%% Step 1: Run "connectToNeuroOmega.m"
- This connects the NeuroOmega (through ethernet) to the task computer
- It is better to do this before running the task to prevent any additional
latencies

%% Step 1a (optional): Could also copy and paste the "Manual Stimulation 
Testing" into the MATLAB terminal and update the inputs if desired (to check 
if stimulation is injecting into the neural data

%% Step 2: Update "skeletonTaskCode.m"
- This is a skeleton code that stimulates at the trial start (after event
marker 9) and shows a fixation. Please see MonkeyLogic documentation about
specifically coding a MonkeyLogic task of interest. However this would work
if just interested in testing event triggered TS.
- In particular, you should update line 17-19 where it asks for specific
parameters for TS. These are the details on the inputs:
        %% Inputs
        StimChannel: Stim channel 
        FirstPhaseDelay_mS: First phase delay (ms)
        FirstPhaseAmpl_mA: First phase amplitude (mA)
        FirstPhaseWidth_mS: First pulse width (ms)
        SecondPhaseDelay_mS: Second phase delay (ms)
        SecondPhaseAmpl_mA: Second phase amplitude (mA)
        SecondPhaseWidth_mS: Second pulse width (ms)
        Freq_hZ: Stimulation Frequench (Hz)
        Duration_sec: length of stimulation (s)
        ReturnChannel: Return channel (-1 would be global return but otherwise
        can set a specific channel)

%% Step 3: Run Task
-  Open the NIMH MonkeyLogic application
- There is a section in the top left of the application that says "To 
start, load a conditions file." Click this and select "skeletonTaskConditions.txt"
- Select "RUN" in the bottom left corner
