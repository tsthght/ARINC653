function [flag,QPortTable ] = FIND_FROM_Configuration_table( QUEUING_PORT_NAME )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global Configuration_table;
global PARTITION_CONFIG;
if numel(Configuration_table)~=0
    flag=0;
    for i=1:numel(Configuration_table)
        if ~isempty(Configuration_table{1,i}) && strcmp(Configuration_table{1,i}.NAME,QUEUING_PORT_NAME) && strcmp(Configuration_table{1,i}.CURRENT_PARTITION_NAME, PARTITION_CONFIG.NAME)
            flag=1;
            QPortTable=Configuration_table{1,i};
            break;
        end
    end

end

