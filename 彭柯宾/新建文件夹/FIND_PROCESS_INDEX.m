function [ PROCESS_INDEX ] = FIND_PROCESS_INDEX( PROCESS_ID )
%FIND_PROCESS_INDEX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global PROCESS_ID_SET;
ind=find(PROCESS_ID_SET==PROCESS_ID);
if isempty(ind) == 1
     PROCESS_INDEX = -1;
     return;
else
    PROCESS_INDEX = ind;
    return; 
    
end


end

