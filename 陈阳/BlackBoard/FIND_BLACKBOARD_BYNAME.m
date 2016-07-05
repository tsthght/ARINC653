function [ INDEX ] = FIND_BLACKBOARD_BYNAME( BLACKBOARD_NAME )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS;
global Blackboard_Set

flag=0;
num=0;
for i=1:SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS
    if ~isempty(Blackboard_Set{1,i}) && strcmp(Blackboard_Set{1,i}.NAME,BLACKBOARD_NAME)
        flag=1;
        num=i;
        break;
    end
end
if flag==0
    INDEX=0;
else
    INDEX=num;

end

