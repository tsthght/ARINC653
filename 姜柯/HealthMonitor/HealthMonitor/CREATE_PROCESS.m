function RETURN_CODE = CREATE_PROCESS(ATTRIBUTE)
         
         global Process_ID_Set;
         global Process_NAME_Set;
         global Process_Set;
         global RETURN_CODE_TYPE;
         global OPERATING_MODE_TYPE;
         global Current_Partition_STATUS;         
           

         if INVALID_NAME(ATTRIBUTE.NAME)
             RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
             return
         end
         
         if ATTRIBUTE.STACK_SIZE<0 || ATTRIBUTE.STACK_SIZE>31
             RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
             return
         end
         
         if ATTRIBUTE.BASE_PRIORITY<0 || ATTRIBUTE.BASE_PRIORITY>31
             RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	         return
         end

         if ATTRIBUTE.PERIOD<0 || ATTRIBUTE.PERIOD>63
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	        return
         end
		
         if ATTRIBUTE.TIME_CAPACITY<0 || ATTRIBUTE.TIME_CAPACITY>63
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	        return
         end
                          
         if ATTRIBUTE.TIME_CAPACITY > ATTRIBUTE.PERIOD
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	        return
         end
    
         if Current_Partition_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
            return
         end

         
         PRO = PROCESS_ATTRIBUTE_TYPE(1,63,31,31,63,63,31,31,31,31,239);
         PRO.ID = 0;
         PRO.DEADLINE_TIME = ATTRIBUTE.DEADLINE_TIME; 
         PRO.CURRENT_PRIORITY = ATTRIBUTE.CURRENT_PRIORITY;
         PRO.PROCESS_STATE = ATTRIBUTE.PROCESS_STATE;
         PRO.PERIOD = ATTRIBUTE.PERIOD;
         PRO.TIME_CAPACITY = ATTRIBUTE.TIME_CAPACITY;
         PRO.ENTRY_POINT = ATTRIBUTE.ENTRY_POINT;
         PRO.STACK_SIZE = ATTRIBUTE.STACK_SIZE;
         PRO.BASE_PRIORITY = ATTRIBUTE.BASE_PRIORITY;
         PRO.DEADLINE = ATTRIBUTE.DEADLINE;
         PRO.NAME = ATTRIBUTE.NAME;
         
         INSERT_INTO_DORMANT(PRO.ID);
         
         INITIALIZE_PROCESS_CONTEXT();
		 INITIALIZE_PROCESS_STACK();			
		      
         num=numel(Process_Set)+1;
         Process_Set{1,num} = PRO;
         Process_ID_Set(num) = PRO.ID;
         Process_NAME_Set(num) = PRO.NAME;
                               
         RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        
end




        
 