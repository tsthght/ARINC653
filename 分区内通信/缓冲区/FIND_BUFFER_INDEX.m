function [ BUFFER_INDEX ] = FIND_BUFFER_INDEX( BUFFER_ID )
%FIND_PROCESS_INDEX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global Buffer_id_set;
ind=find(Buffer_id_set==BUFFER_ID);
if isempty(ind) == 1
     BUFFER_INDEX = -1;
     return;
else
    BUFFER_INDEX = ind;
    return; 
    
end