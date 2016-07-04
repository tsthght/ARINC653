function [flag] = INVALID_ID(NUM)

global PROCESS_ID_SET;
flag=0;
if sum( ismember(PROCESS_ID_SET,NUM) )>=1
    flag = 1;
    return;
end
% L = 0;
% for i= 1:length(Process_Set)
%     if ~isempty(Process_Set{1,i})
%         L=L+1;
%     end
% end
% 
% if L == 0
%    flag = 0;
%    return;
% else
%     for i=1:L
%         
%         if Process_Set{1,i}.ID == NUM
%             flag = 1;
%             return;
%         end
%     end
% end

%disp(flag);