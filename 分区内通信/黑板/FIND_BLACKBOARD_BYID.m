function [INDEX ] = FIND_BLACKBOARD_BYID( BLACKBOARD_ID )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
global SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS;
global Blackboard_Set

flag=0;
num=0;
for i=1:numel(Blackboard_Set)
    if ~isempty(Blackboard_Set{1,i})&&Blackboard_Set{1,i}.ID==BLACKBOARD_ID
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

