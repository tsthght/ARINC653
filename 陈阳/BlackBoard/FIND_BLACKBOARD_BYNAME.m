function [ INDEX ] = FIND_BLACKBOARD_BYNAME( BLACKBOARD_NAME )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

