function RETURN_CODE = START(PROCESS_ID)
               
        global PROCESS_STATE_TYPE;
        global RETURN_CODE_TYPE;
        global OPERATING_MODE_TYPE;
        global Process_ID_Set;
        global Process_NAME_Set;
        global Process_Set;
        global Current_Partition_STATUS;
        % error
        flag=INVALID_ID(PROCESS_ID);
        if flag == 0
			RETURN_CODE = RETURN_CODE_TPYE.INVALID_PARAM;

			return
        end
        %通过PROCESS_ID从Process_Set中调取该进程的pcb
        %形式如Process_Set{1,PROCESS_ID}
  	    if Process_Set{1,PROCESS_ID}.PROCESS_STATE ~= PROCESS_STATE_TYPE.DORMANT
    		RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;

    		return
        end 		
        if Process_Set{1,PROCESS_ID}.DEADLINE_TIME<0 || Process_Set{1,PROCESS_ID}.DEADLINE_TIME>63
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;

            return
        end
        % normal        
        % aperiodic process means period = 0
        % periodic process means period = 1    
  		if Process_Set{1,PROCESS_ID}.PERIOD == 0
			Process_Set{1,PROCESS_ID}.BASE_PRIORITY = Process_Set{1,PROCESS_ID}.CURRENT_PRIORITY;			
            INITIALIZE_PROCESS_CONTEXT();
			INITIALIZE_PROCESS_STACK();	
			if Current_Partition_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL		
				Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
                DELETE_FROM_DORMANT(PROCESS_ID);
                INSERT_INTO_READY(PROCESS_ID);% 将进程插入READY队列
				Process_Set{1,PROCESS_ID}.DEADLINE_TIME = 10 + Process_Set{1,PROCESS_ID}.TIME_CAPACITY;% CURRENT_SYSTEM_CLOCK()				                
                if Current_Partition_STATUS.LOCK_LEVEL == 0
    				PROCESS_SCHEDULING();% 请求进程调度
                end                
            else
				Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
				DELETE_FROM_DORMANT(PROCESS_ID);
                INSERT_INTO_WAITING(PROCESS_ID);% 将进程插入WAITING队列
            end            
			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;

			return		
        else		
  			Process_Set{1,PROCESS_ID}.BASE_PRIORITY = Process_Set{1,PROCESS_ID}.CURRENT_PRIORITY;			
            INITIALIZE_PROCESS_CONTEXT();
			INITIALIZE_PROCESS_STACK();			 
			if Current_Partition_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL				
				Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
				DELETE_FROM_DORMANT(PROCESS_ID);
                INSERT_INTO_WAITING(PROCESS_ID);% 将进程插入WAITING队列			
				Process_Set{1,PROCESS_ID}.DEADLINE_TIME = 10 + Process_Set{1,PROCESS_ID}.TIME_CAPACITY;% FIRST_RELEASE_POINT()		
            else			
				Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
				DELETE_FROM_DORMANT(PROCESS_ID);
                INSERT_INTO_WAITING(PROCESS_ID);% 将进程插入WAITING队列	            
            end            
			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;

			return      
        end
        
end


