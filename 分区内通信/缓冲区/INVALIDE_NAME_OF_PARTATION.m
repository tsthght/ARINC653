% STR='pkb';
% Ch = {'pkb','LKR'};
% Ch = cell(1,2);
% Ch{1,1}='pkb';
% Ch{1,2}='LKR';

function [flag] = INVALIDE_NAME(STR)
%PROCESS_ATTRIBUTE_TYPE.NAME='pkb';

global PROCESS_NAME_SET;
flag=0;

if sum( ismember(PROCESS_NAME_SET,STR) ) >=  1
    flag = 1;
    return;
end

% for i=1:MAX_NUMBER_OF_PROCESS 
% %      x = Process_Set{1,i}.NAME
% % Process_NAME_Set{1,i}
%     if isempty(Process_Set{1,i}) == 0
%         if strcmp(STR,Process_Set{1,i}.NAME) == 1
%             flag = 1;
%             break;     
%         
%         end
%     end
% end
%disp(flag);