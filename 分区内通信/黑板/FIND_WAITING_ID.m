function [ id ] = FIND_WAITING_ID(  a,d  )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
global Waiting_Blackboard_Set;
id=0;
for i=d:numel(Waiting_Blackboard_Set)
    if ~isempty(Waiting_Blackboard_Set{1,i})&&Waiting_Blackboard_Set{1,i}.BLACKBOARD_ID==a.ID
        
        id=Waiting_Blackboard_Set{1,i}.ID;
        Waiting_Blackboard_Set{1,i}=[];
        break;
    end
    
end


end

