function  STOP_TIME_COUNTER( id )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global Waiting_Timer_Set
 for i=1:255
             if Waiting_Timer_Set{1,i}==id
                 Waiting_Timer_Set{1,i}=[];
                 break;
             end
 end 

end

