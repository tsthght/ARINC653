% STR='pkb';
% Ch = {'pkb','LKR'};
% Ch = cell(1,2);
% Ch{1,1}='pkb';
% Ch{1,2}='LKR';

function [flag] = INVALID_NAME(STR)
%PROCESS_ATTRIBUTE_TYPE.NAME='pkb';
global MAX_NUMBER_OF_PROCESS;
global Sampling_Set;
flag=0;
for i=1:MAX_NUMBER_OF_PROCESS
%      x = Process_Set{1,i}.NAME
% Process_NAME_Set{1,i}
    if isempty(Sampling_Set{1,i}) == 0
        if strcmp(STR,Sampling_Set{1,i}.SAMPLING_PORT_NAME)==1
             flag = 1;
        end   
    end
end

%disp(flag);