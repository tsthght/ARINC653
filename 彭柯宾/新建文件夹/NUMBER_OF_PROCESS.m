function [ NUMBER ] = NUMBER_OF_PROCESS()
%NUMBER_OF_PROCESS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    global Process_Set;
    global MAX_NUMBER_OF_PROCESS
    NUMBER =  length(find(cell2mat(cellfun(@(x)(length(x)),Process_Set,'Un',false))==0));
end

