function [ id ] = FIND_WAITING_ID(  a,d  )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

