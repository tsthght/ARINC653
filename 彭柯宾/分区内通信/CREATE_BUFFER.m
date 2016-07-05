function [BUFFER_ID,RETURN_CODE]=CREATE_BUFFER(BUFFER_NAME,MAX_MESSAGE_SIZE,MAX_NB_MESSAGE,QUEUING_DISCIPLINE)
	
        global SYSTEM_LIMIT_NUMBER_OF_BUFFERS
        global SYSTEM_NUMBER_OF_BUFFERS
        global RETURN_CODE_TYPE
        global OPERATING_MODE_TYPE
        global CURRENT_PARTITION_STATUS
        global BUFFER_ATTRIBUTE
        global Waiting_Buffer_Set
        global Buffer_name_set;
        global Buffer_id_set;
        global Buffer_set;
        global MAX_NUMBER_OF_PROCESS;
       
    
        
  		if INVALID_NAME(BUFFER_NAME) == 1 
  			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            BUFFER_ID=-1;
			return
        end
        
        if INVALID_MAX_MESSAGE_SIZE(MAX_MESSAGE_SIZE) == 1
		    BUFFER_ID=-1;
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
       
		if INVALID_MAX_NB_MESSAGE(MAX_NB_MESSAGE) == 0
		    BUFFER_ID=-1;
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
         
        
		if INVALID_QUEUING_DISCIPLINE(QUEUING_DISCIPLINE) == 0
		     BUFFER_ID=-1;
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
         
		if SYSTEM_NUMBER_OF_BUFFERS == SYSTEM_LIMIT_NUMBER_OF_BUFFERS
    		 BUFFER_ID=-1;
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    		return;
        end
        if CURRENT_PARTITION_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL
            BUFFER_ID=-1;
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
        end
        
%   		if(@.<NAME:BLACKBOARD_NAME>:Blackboard_Set)
%     	{	
%     		*RETURN_CODE = NO_ACTION;
%     		return;
%     	}
 
      	if(CURRENT_PARTITION_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL)
        	 BUFFER_ID=-1;
        	RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
        	return;
        end

%       	Buff.<NAME:NULL> : Buffer_Set;
		
        
        SYSTEM_NUMBER_OF_BUFFERS = SYSTEM_NUMBER_OF_BUFFERS + 1;
        BUFFER_ID  = round( 1+MAX_NUMBER_OF_PROCESS *rand(1,1) );
        
        BUF = BUFFER_TYPE(BUFFER_NAME,BUFFER_ID,BUFFER_ATTRIBUTE.NB_MESSAGE,BUFFER_ATTRIBUTE.MAX_NB_MESSAGE,BUFFER_ATTRIBUTE.MAX_MESSAGE_SIZE,BUFFER_ATTRIBUTE.WAITING_PROCESSES,BUFFER_ATTRIBUTE.QUEUING_DISCIPLINE);
        index = sum( cellfun('length',Buffer_set ) )+1; 
        Buffer_set{1,index} = BUF;
        Waiting_Buffer_Set{1,index} = BUF;
        Buffer_name_set{1,index} = BUFFER_NAME;
        Buffer_id_set = BUFFER_ID;

        %        BUFFER_ATTRIBUTE.NAME = BUFFER_NAME;
       
      
% 		BUF.NAME = BUFFER_NAME;
% 		BUF.NB_MESSAGE = 0;
% 		BUF.MAX_NB_MESSAGE = MAX_NB_MESSAGE;
% 		BUF.MAX_MESSAGE_SIZE = MAX_MESSAGE_SIZE;
% 		BUF.WAITING_PROCESSES = 0;
% 		BUF.QUEUING_DISCIPLINE = QUEUING_DISCIPLINE; 		
  		
  		
  		
  		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
        
	
