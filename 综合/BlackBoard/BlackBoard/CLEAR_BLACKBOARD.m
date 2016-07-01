function [ RETURN_CODE ] = CLEAR_BLACKBOARD( BLACKBOARD_ID )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
global RETURN_CODE_TYPE;
global Blackboard_Set;


TEMP_LENGTH = 0;
if INVALID_ID(BLACKBOARD_ID)
    RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
			return;

end
 flag=0;
 s=0;
            for i=1:255
                if ~isempty(Blackboard_Set{1,i}) && Blackboard_Set{1,i}.ID == BLACKBOARD_ID 
                    s =i;
                    flag=1;
                    break;
                end
            end
    if flag==0
         RETURN_CODE =  RETURN_CODE_TYPE.INVALID_PARAM;
			return;
    end 
    Blackboard_Set{1,s}.EMPTY_INDICATOR =EMPTY_INDICATOR_TYPE.EMPTY;
    while TEMP_LENGTH <Blackboard_Set{1,s}.MAX_MESSAGE_SIZE
        Blackboard_Set{1,s}.MESSAGE_ADDR{1,TEMP_LENGTH +1}=[];
        TEMP_LENGTH = TEMP_LENGTH + 1;
    end
    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;










end

