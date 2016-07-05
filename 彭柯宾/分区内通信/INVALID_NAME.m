% STR='pkb';
% Ch = {'pkb','LKR'};
% Ch = cell(1,2);
% Ch{1,1}='pkb';
% Ch{1,2}='LKR';

function [flag] = INVALID_NAME(STR)
%PROCESS_ATTRIBUTE_TYPE.NAME='pkb';
global Buffer_name_set;
flag=0;

if sum( ismember( Buffer_name_set,STR) ) >=  1
    flag = 1;
    return;
end