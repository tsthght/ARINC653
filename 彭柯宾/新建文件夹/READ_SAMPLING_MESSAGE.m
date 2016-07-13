function [ LENGTH,VALIDITY,RETURN_CODE ] = READ_SAMPLING_MESSAGE( SAMPLING_PORT_ID,DES_SAMPLING_PORT_ID,MESSAGE_ADDR )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global RETURN_CODE_TYPE
global SAMPLING_PORT_ATTRIBUTE	
global EMPTY_INDICATOR_TYPE
global PORT_DIRECTION_TYPE
global Sampling_Set
global SPORT
global VALIDITY_TYPE

  		TEMP_LENGTH = 0;
  		
  		if(INVALID_NAME_OF_SAMPLING(SAMPLING_PORT_ID))
  		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
		if(INVALID_MESSAGE_ADDR_OF_SAMPLING(MESSAGE_ADDR))
		  
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
		
    	
%   		SPort = SAMPLING_PORT(SAMPLING_PORT_ATTRIBUTE.ID,SAMPLING_PORT_ATTRIBUTE.LAST_MSG_VALIDITY);
	
  		
        Index = find_index_OF_SAMPLING(DES_SAMPLING_PORT_ID);
  		if(Sampling_Set{1,Index}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.DESTINATION)
    		
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    		return;
        end
        
  		if(SPORT.EMPTY_INDICATOR == EMPTY_INDICATOR_TYPE.EMPTY)
  		   
    		LENGTH = 0;
    		VALIDITY = INVALID;
    		SPort.LAST_MSG_VALIDITY = INVALID;
    		
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    		return;
  		
  		else
  		
%     		while(TEMP_LENGTH < SPORT.LENGTH )
% 			
% %   			*(MESSAGE_ADDR + TEMP_LENGTH) = *(SPort.MESSAGE_ADDR + TEMP_LENGTH);
%   				TEMP_LENGTH = TEMP_LENGTH + 1;
%             end
    	
    		LENGTH = PASTE_OF_SAMPLING( SAMPLING_PORT_ID,DES_SAMPLING_PORT_ID,MESSAGE_ADDR )
    		VALIDITY = VALIDITY_TYPE.VALID;
%     		if(age of the copied message is consistent with the required REFRESH_PERIOD
% 				attribute of the port)
%     		
% 				*VALIDITY = VALID;
%       			SPort.LAST_MSG_VALIDITY = VALID;
% 			
%     		else
%     		
%      			*VALIDITY = INVALID;
%       			SPort.LAST_MSG_VALIDITY = INVALID;
%             end
    		
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
    		return;
        end
	end

