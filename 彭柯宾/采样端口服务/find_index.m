function [ Index] = find_index( ID )
%FIND �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global MAX_NUMBER_OF_PROCESS;
global Sampling_Set;

    for i = 1:MAX_NUMBER_OF_PROCESS
        if ID == Sampling_Set{1,i}.ID
            Index = i;
            return;
        end
    end


