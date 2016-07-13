function [ Index] = find_index( ID )
%FIND 此处显示有关此函数的摘要
%   此处显示详细说明
global MAX_NUMBER_OF_PROCESS;
global Sampling_Set;

    for i = 1:MAX_NUMBER_OF_PROCESS
        if ID == Sampling_Set{1,i}.ID
            Index = i;
            return;
        end
    end


