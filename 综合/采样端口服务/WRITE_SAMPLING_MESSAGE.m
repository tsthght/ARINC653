function [ RETURN_CODE ] = WRITE_SAMPLING_MESSAGE( SAMPLING_PORT_ID,MESSAGE_ADDR,LENGTH )
%WRITE_SAMPLING_MESSAGE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global RETURN_CODE_TYPE

	
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
        
%   		if(~(@.<ID:SAMPLING_PORT_ID> :Sampling_Set))
%     	{	
%     		*RETURN_CODE = INVALID_PARAM;
%     		return;
%     	}
    	
%     	SPort.<ID:SAMPLING_PORT_ID> :Sampling_Set;
    	
%   		if(SPort.PORT_DIRECTION ~= SOURCE)
%     		
%     		RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
%     		return;
%         end

  		while(TEMP_LENGTH < LENGTH )
		     
            TEMP_LENGTH = MESSAGE_ADDR + TEMP_LENGTH;
  			SPort.MESSAGE_ADDR = TEMP_LENGTH ;
  			TEMP_LENGTH = TEMP_LENGTH + 1;
        end
	
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		
	


end

