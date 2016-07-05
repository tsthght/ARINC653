function [BUFFER_ID,RETURN_CODE]=GET_BUFFER_ID( BUFFER_NAME )
	global RETURN_CODE_TYPE

  		if INVALID_NAME(BUFFER_NAME) == 0
  			BUFFER_ID = -1;
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
% 		if(~(@.<NAME:BUFFER_NAME>:Buffer_Set))
%     	{	
%     		*RETURN_CODE = INVALID_CONFIG;
%     		return;
%     	}
    	
% 		Buff.<NAME:BUFFER_NAME>:Buffer_Set;
        ans = FIND_BUFFER_NAME(BUFFER_NAME);
%         if ans == -1
%             fprintf('invalid name!\n');
%         else
            BUFFER_ID = ans.ID;
  		    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
%         end

