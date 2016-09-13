function INCERT_INTO_WBlackboard( a,b )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
global  Waiting_Blackboard_Set;
 for i=1:256
        if isempty(Waiting_Blackboard_Set{1,i})
            Waiting_Blackboard_Set{1,i}.ID=a;
            Waiting_Blackboard_Set{1,i}.BLACKBOARD_ID=b;
            break
        end
end

end

