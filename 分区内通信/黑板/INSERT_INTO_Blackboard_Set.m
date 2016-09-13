function  INSERT_INTO_Blackboard_Set( BBoard )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global Blackboard_Set; 


 Blackboard_Set{1,numel(Blackboard_Set)+1}=BBoard;
        

 
end

