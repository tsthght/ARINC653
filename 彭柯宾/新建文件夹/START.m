function [RETURN_CODE] = START(PROCESS_ID)
               
        global PROCESS_STATE_TYPE;
        global RETURN_CODE_TYPE;
        global OPERATING_MODE_TYPE;
        global Process_Set;
        global Current_Partition_STATUS;
        global PROCESS_SCHEDULING_FLAG;
        %
        location = FIND_PROCESS_INDEX( PROCESS_ID ); 
        if location == -1
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return
        end
        %
  	    if Process_Set{1,location}.PROCESS_STATE ~= PROCESS_STATE_TYPE.DORMANT
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    		return
        end
        %
        if Process_Set{1,location}.DEADLINE_TIME<0 || Process_Set{1,location}.DEADLINE_TIME>63
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
            return
        end
        % normal        
        % aperiodic process means period = 0
        % periodic process means period = 1    
  		if Process_Set{1,location}.PERIOD == 0
			Process_Set{1,location}.BASE_PRIORITY = Process_Set{1,location}.CURRENT_PRIORITY;			
            INITIALIZE_PROCESS_CONTEXT();
			INITIALIZE_PROCESS_STACK();	
			if  Current_Partition_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL		
				Process_Set{1,location}.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
                DELETE_FROM_DORMANT(PROCESS_ID);
                INSERT_INTO_READY(PROCESS_ID);
				Process_Set{1,location}.DEADLINE_TIME = 10 + Process_Set{1,location}.TIME_CAPACITY;% CURRENT_SYSTEM_CLOCK()				                
                if  Current_Partition_STATUS.LOCK_LEVEL == 0
    				PROCESS_SCHEDULING_FLAG{1,1}=1;
                end                
            else
				Process_Set{1,location}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
				DELETE_FROM_DORMANT(PROCESS_ID);
                INSERT_INTO_WAITING(PROCESS_ID);
            end            
			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
			return		
        else		
  			Process_Set{1,location}.BASE_PRIORITY = Process_Set{1,location}.CURRENT_PRIORITY;			
            INITIALIZE_PROCESS_CONTEXT();
			INITIALIZE_PROCESS_STACK();			 
			if  Current_Partition_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL				
				Process_Set{1,location}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
				DELETE_FROM_DORMANT(PROCESS_ID);
                INSERT_INTO_WAITING(PROCESS_ID);			
				Process_Set{1,location}.DEADLINE_TIME = 10 + Process_Set{1,location}.TIME_CAPACITY;% FIRST_RELEASE_POINT()		
            else			
				Process_Set{1,location}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
				DELETE_FROM_DORMANT(PROCESS_ID);
                INSERT_INTO_WAITING(PROCESS_ID);            
            end            
			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
			return      
        end
        
end


