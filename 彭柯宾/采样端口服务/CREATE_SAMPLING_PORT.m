function [ SAMPLING_PORT_ID,RETURN_CODE ] = CREATE_SAMPLING_PORT(SAMPLING_PORT_NAME,REFRESH_PERIOD,MAX_MESSAGE_SIZE,PORT_DIRECTION)
%CREATE_SAMPLING_PORT 此处显示有关此函数的摘要
%   此处显示详细说明
	global RETURN_CODE_TYPE
    global SAMPLING_PORT_ATTRIBUTE

		if(INVALID_NAME(SAMPLING_PORT_NAME))
  		    
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
		if(INVALID_MAX_MESSAGE_SIZE(MAX_MESSAGE_SIZE)==0)
		    fprintf('sadsa');
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
		if(INVALID_PORT_DIRECTION(PORT_DIRECTION))
		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
		if(INVALID_REFRESH_PERIOD(REFRESH_PERIOD))
		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
		 global SYSTEM_NUMBER_OF_SAMPLING_PORTS
         global MAX_NUMBER_OF_SAMPLING_PORTS
      
		if(SYSTEM_NUMBER_OF_SAMPLING_PORTS == MAX_NUMBER_OF_SAMPLING_PORTS )
    		
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    		return;
        end
        global SPortTable					
%   		if(MAX_MESSAGE_SIZE ~= SPortTable.MAX_MESSAGE_SIZE)
%    			
%    			RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
%    			return;
%         end
        
%    		if(PORT_DIRECTION ~= SPortTable.PORT_DIRECTION)
%    			
%    			RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
%    			return;
%         end
        
%    		if(SAMPLING_PORT_NAME ~= SPortTable.SAMPLING_PORT_NAME)
%    			
%    			RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
%    			return;
%         end
        
%  		if(Current_Partition_STATUE.OPERATING_MODE == NORMAL)
%    		
%    			RETURN_CODE = INVALID_MODE;
%    			return;
%         end

 		global Sampling_Set;
%         L=0;
%         for i=1:255
%             if ~isempty(Sampling_Set(i))
%                 L = L+1;
%             else
%                 break;
%             end
%         end
        
        SPort = SAMPLING_PORT(SAMPLING_PORT_ATTRIBUTE.ID,SAMPLING_PORT_ATTRIBUTE.LAST_MSG_VALIDITY);

        Sampling_Set(numel(Sampling_Set)+1) = SAMPLING_PORT_ATTRIBUTE.ID;
 		SPort.NAME = SAMPLING_PORT_NAME;
 		SPort.REFRESH_PERIOD = REFRESH_PERIOD;
 		SPort.MAX_MESSAGE_SIZE = MAX_MESSAGE_SIZE;
 		SPort.PORT_DIRECTION = PORT_DIRECTION;
        global Sampling_obj
        Sampling_obj{1,length(Sampling_obj)+1} = SPort;
        
        
 		SAMPLING_PORT_ID = SAMPLING_PORT_ATTRIBUTE.ID; 
 	    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
 end

