function [starttimes]=compileEventStarts(behavioralData, numTrials)
% Michaela Alarie, Brown University
% Updated: July 17, 2023
%%% Usage:
% Compiles trial start times from MonkeyLogic task data structure

%%% Inputs:
% behavioraldata: .mat file with task data
% numTrials: number of trials in task to loop through

%%% Output
% subjectData: output of loaded json file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% load task
taskbehavior=load(behavioralData);
%% extract trial starts
for k=1:numTrials
    starttimes(k)=(taskbehavior.(sprintf(['Trial', num2str(k)])).AbsoluteTrialStartTime)/1000+(taskbehavior.(sprintf(['Trial', num2str(k)])).BehavioralCodes.CodeTimes(1))/1000;
end

end