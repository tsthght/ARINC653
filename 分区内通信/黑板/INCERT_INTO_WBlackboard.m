function INCERT_INTO_WBlackboard( a,b )
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global  Waiting_Blackboard_Set;
 for i=1:256
        if isempty(Waiting_Blackboard_Set{1,i})
            Waiting_Blackboard_Set{1,i}.ID=a;
            Waiting_Blackboard_Set{1,i}.BLACKBOARD_ID=b;
            break
        end
end

end

