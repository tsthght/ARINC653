function [ RETURN_CODE ] = WRITE_SAMPLING_MESSAGE( SAMPLING_PORT_ID,MESSAGE_ADDR,LENGTH )
%WRITE_SAMPLING_MESSAGE 此处显示有关此函数的摘要
%   此处显示详细说明
global RETURN_CODE_TYPE;
global SPortTable;
global PORT_DIRECTION_TYPE;
global Sampling_Set;
global MAX_NUMBER_OF_PROCESS;
  		TEMP_LENGTH = 0;
  		
  		if(INVALID_NAME(SAMPLING_PORT_ID))
  			
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
		if(INVALID_MESSAGE_ADDR(MESSAGE_ADDR))
		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
		if(INVALID_LENGTH(LENGTH))
		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
        COPY( SAMPLING_PORT_ID,MESSAGE_ADDR,LENGTH );

    	Index = find_index(SAMPLING_PORT_ID);
  		if(Sampling_Set{1,Index}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.SOURCE)
    		
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    		return;
        end
        
      
        
        
%   		while(TEMP_LENGTH < LENGTH )
% 		     
%             TEMP_LENGTH = MESSAGE_ADDR + TEMP_LENGTH;
%   			SPort.MESSAGE_ADDR = TEMP_LENGTH ;
%   			TEMP_LENGTH = TEMP_LENGTH + 1;
%         end
	
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		
	


end

