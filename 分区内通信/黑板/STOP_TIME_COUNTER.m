function  STOP_TIME_COUNTER( id )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
global Waiting_Timer_Set
 for i=1:255
             if Waiting_Timer_Set{1,i}==id
                 Waiting_Timer_Set{1,i}=[];
                 break;
             end
 end 

end

