function [ PROCESS ] = FIND_PROCESS( WBPro_ID )
%FIND_PROCESS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global SYSTEM_LIMIT_NUMBER_OF_BUFFERS;
global Process_Set;

for i= 1:SYSTEM_LIMIT_NUMBER_OF_BUFFERS 
    if WBPro_ID == Process_Set{1,i}.ID
        PROCESS = Process_Set{1,i};
        return;
    end
end


