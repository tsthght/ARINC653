function [RETURN_CODE,PROCESS_STATUS]=GET_PROCESS_STATUS (PROCESS_ID)
	    
        

    
        global RETURN_CODE_TYPE;
        global PROCESS_STATUS;
        global Process_Set;
        global SYSTEM_NUMBER_OF_PROCESS;

		if INVALID_ID(PROCESS_ID) == 0
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        i=0;
        
        for i = 1:SYSTEM_NUMBER_OF_PROCESS 
            if  isempty( Process_Set{1,i} ) == 0 && Process_Set{1,i}.ID == PROCESS_ID
                PROCESS_STATUS.DEADLINE_TIME = Process_Set{1,i}.DEADLINE_TIME;
                PROCESS_STATUS.CURRENT_PRIORITY = Process_Set{1,i}.CURRENT_PRIORITY;
                PROCESS_STATUS.PROCESS_STATUS = Process_Set{1,i}.PROCESS_STATE;
                PROCESS_STATUS.ATTRIBUTES.NAME = Process_Set{1,i}.NAME;
                PROCESS_STATUS.ATTRIBUTES.ENTRY_POINT = Process_Set{1,i}.ENTRY_POINT;
                PROCESS_STATUS.ATTRIBUTES.STACK_SIZE  = Process_Set{1,i}.STACK_SIZE;
                PROCESS_STATUS.ATTRIBUTES.BASE_PRIORITY = Process_Set{1,i}.BASE_PRIORITY;
                PROCESS_STATUS.ATTRIBUTES.PERIOD = Process_Set{1,i}.PERIOD;
                PROCESS_STATUS.ATTRIBUTES.TIME_CAPACITY = Process_Set{1,i}.TIME_CAPACITY;
                PROCESS_STATUS.ATTRIBUTES. DEADLINE = Process_Set{1,i}.DEADLINE;
            end
        end
        
		 

       
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;

	