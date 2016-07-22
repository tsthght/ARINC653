function [RETURN_CODE]=CREATE_PROCESS(ATTRIBUTES)
    
         global RETURN_CODE_TYPE;
         global PROCESS_STATE_TYPE;
         global Process_Set;
         global Dormant_Processes_set;
         global MAX_NUMBER_OF_PROCESSES;
         global MIN_PRIORITY_VALUE;
         global MAX_PRIORITY_VALUE;
         global SYSTEM_TIME_TYPE;
         global Current_Partition_STATUS;
         global OPERATING_MODE_TYPE;
         global PROCESS_NAME_SET;
         global PROCESS_ID_SET;
         global SYSTEM_NUMBER_OF_PROCESSES;
        

         if SYSTEM_NUMBER_OF_PROCESSES == MAX_NUMBER_OF_PROCESSES
             RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
             return;
         end

         if INVALIDE_NAME(ATTRIBUTES.NAME) == 1
             RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
             return;
         end
         
         if ATTRIBUTES.STACK_SIZE<0 || ATTRIBUTES.STACK_SIZE > MAX_NUMBER_OF_PROCESSES
             RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
             return;
         end
         
        if ATTRIBUTES.BASE_PRIORITY<MIN_PRIORITY_VALUE || ATTRIBUTES.BASE_PRIORITY>MAX_PRIORITY_VALUE
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            return;
        end
        
        if ATTRIBUTES.PERIOD < 0 || ATTRIBUTES.PERIOD > SYSTEM_TIME_TYPE
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
            return;
        end
        
        if ATTRIBUTES.TIME_CAPACITY < 0 || ATTRIBUTES.TIME_CAPACITY > SYSTEM_TIME_TYPE
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            return;
        end
		
        if ATTRIBUTES.TIME_CAPACITY < 0 || ATTRIBUTES.TIME_CAPACITY > SYSTEM_TIME_TYPE
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            return;
        end
         
        if Current_Partition_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            return;
        end

        id =  GENERATE_ID();
        
        if INVALID_ID(id)==1
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
	        return;
        end
        
        parid = Current_Partition_STATUS.IDENTIFIER;
        
        deadline_time = 1 + ATTRIBUTES.TIME_CAPACITY;
        
        current_priority = ATTRIBUTES.BASE_PRIORITY;
        
        process_state = PROCESS_STATE_TYPE.DORMANT;
        
      
        PRO = PROCESS_TYPE(id,ATTRIBUTES.NAME,parid,deadline_time,current_priority,process_state,ATTRIBUTES.PERIOD,ATTRIBUTES.TIME_CAPACITY,ATTRIBUTES.ENTRY_POINT,ATTRIBUTES.STACK_SIZE,ATTRIBUTES.BASE_PRIORITY,ATTRIBUTES.DEADLINE);
        
        SYSTEM_NUMBER_OF_PROCESSES = SYSTEM_NUMBER_OF_PROCESSES+1;
             
        index = sum( cellfun('length',Process_Set) )+1;
       
          PROCESS_NAME_SET{1,index} = ATTRIBUTES.NAME;
          PROCESS_ID_SET(index) = PRO.ID;
          Process_Set{1,index} = PRO;
          Dormant_Processes_set(index) = PRO.ID;

				
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        
end




        
 