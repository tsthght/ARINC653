function [ SAMPLING_PORT_STATUS,RETURN_CODE ] = GET_SAMPLING_PORT_STATUS( SAMPLING_PORT_ID )
%GET_SAMPLING_PORT_STATUS 此处显示有关此函数的摘要
%   此处显示详细说明
	    global RETURN_CODE_TYPE
        global Sampling_Set

  		if(INVALID_NAME(SAMPLING_PORT_ID))
  			
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end

		for i =1:length(Sampling_Set)
            if isempty(Sampling_Set{1,i}) == 0
                if Sampling_Set{1,i}.ID ==  SAMPLING_PORT_ID
                    ANS=i;
                end
            end
            
        end
        
        global Sampling_obj;
        
%         global SAMPLING_PORT_STATUS;

  		SAMPLING_PORT_STATUS.REFRESH_PERIOD = Sampling_Set{1,ANS}.REFRESH_PERIOD;
  		SAMPLING_PORT_STATUS.MAX_MESSAGE_SIZE = Sampling_Set{1,ANS}.MAX_MESSAGE_SIZE;
  		SAMPLING_PORT_STATUS.PORT_DIRECTION = Sampling_Set{1,ANS}.PORT_DIRECTION;
  		SAMPLING_PORT_STATUS.LAST_MSG_VALIDITY = Sampling_Set{1,ANS}.LAST_MSG_VALIDITY;
  		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
  		
end

