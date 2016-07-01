function [ SAMPLING_PORT_STATUS,RETURN_CODE ] = GET_SAMPLING_PORT_STATUS( SAMPLING_PORT_ID )
%GET_SAMPLING_PORT_STATUS 此处显示有关此函数的摘要
%   此处显示详细说明
	    global RETURN_CODE_TYPE
        global Sampling_Set

  		if(INVALID_NAME(SAMPLING_PORT_ID))
  			
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end

		for i = 1:length(Sampling_Set)
            if Sampling_Set(i) == SAMPLING_PORT_ID
                break;
            end
        end
        
        global Sampling_obj;
        
%         global SAMPLING_PORT_STATUS;

  		SAMPLING_PORT_STATUS.REFRESH_PERIOD = Sampling_obj{1,i}.REFRESH_PERIOD;
  		SAMPLING_PORT_STATUS.MAX_MESSAGE_SIZE = Sampling_obj{1,i}.MAX_MESSAGE_SIZE;
  		SAMPLING_PORT_STATUS.PORT_DIRECTION = Sampling_obj{1,i}.PORT_DIRECTION;
  		SAMPLING_PORT_STATUS.LAST_MSG_VALIDITY = Sampling_obj{1,i}.LAST_MSG_VALIDITY;
  		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
  		
end

