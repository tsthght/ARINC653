function  INSERT_INTO_Blackboard_Set( BBoard )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global Blackboard_Set; 
global SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS; 

 for i=1:SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS
         if isempty(Blackboard_Set{1,i})
             Blackboard_Set{1,i}=BBoard;
              break;
         end

 end
end

