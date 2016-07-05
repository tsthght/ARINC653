function [ RETURN_CODE,BLACKBOARD_STATUS  ] =  GET_BLACKBOARD_STATUS( BLACKBOARD_ID )
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
global RETURN_CODE_TYPE;
global Blackboard_Set;

if INVALID_ID(BLACKBOARD_ID)
    RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
    BLACKBOARD_STATUS=[];
			return;
end

flag=0;
 s=0;
            for i=1:256
                if ~isempty(Blackboard_Set{1,i}) && Blackboard_Set{1,i}.ID == BLACKBOARD_ID 
                    s =i;
                    flag=1;
                    break;
                end
            end
    if flag==0
         RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
         BLACKBOARD_STATUS=[];
			return;
    end 
    
BLACKBOARD_STATUS.EMPTY_INDICATOR=Blackboard_Set{1,s}.EMPTY_INDICATOR;
BLACKBOARD_STATUS.MAX_MESSAGE_SIZE = Blackboard_Set{1,s}.MAX_MESSAGE_SIZE;
BLACKBOARD_STATUS.WAITING_PROCESSES =  Blackboard_Set{1,s}.WAITING_PROCESSES;
RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;




end

