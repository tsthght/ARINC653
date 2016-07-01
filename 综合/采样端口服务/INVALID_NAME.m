% STR='pkb';
% Ch = {'pkb','LKR'};
% Ch = cell(1,2);
% Ch{1,1}='pkb';
% Ch{1,2}='LKR';

function [flag] = INVALIDE_NAME(STR)
%PROCESS_ATTRIBUTE_TYPE.NAME='pkb';
global Process_NAME_Set;
global Process_Set;
flag=0;
for i=1:255
%      x = Process_Set{1,i}.NAME
% Process_NAME_Set{1,i}
    if isempty(Process_Set{1,i})
        flag = 0;
        
    elseif strcmp(STR,Process_Set{1,i}.NAME)==1
        flag = 1;
        
    else
        flag = 0;
    end
end

%disp(flag);