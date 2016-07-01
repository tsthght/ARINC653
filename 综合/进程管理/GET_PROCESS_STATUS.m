function [RETURN_CODE,PROCESS_STATUS]=GET_PROCESS_STATUS (PROCESS_ID)
	
        global RETURN_CODE_TYPE;
        global PROCESS_STATE_TYPE;
        global Process_Set;
		if INVALID_ID(PROCESS_ID) == 0
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        i=0;
        
        for i = 1:255
            if i == PROCESS_ID

                x=Process_Set{1,i};
                
                PROCESS_STATUS = x.PROCESS_STATE;
            end
        end
        
		 
% 		/*
% 		if(~(@.<ID:PROCESS_ID> : Process_Set))
% 		{	
% 			*RETURN_CODE = INVALID_PARAM;
% 			return;
% 		}
% 		*/
		
% 		Pro.<ID:PROCESS_ID> : Process_Set;
		
% 		PRO.DEADLINE_TIME = Pro->DEADLINE_TIME;
% 		PRO.CURRENT_PRIORITY = Pro->CURRENT_PRIORITY;
% 		PRO.PROCESS_STATE = Pro->PROCESS_STATE;
% 		PRO.PERIOD = Pro->PERIOD;
% 		PRO.TIME_CAPACITY = Pro->TIME_CAPACITY;
% 		PRO.ENTRY_POINT = Pro->ENTRY_POINT;
% 		PRO.STACK_SIZE = Pro->STACK_SIZE;
% 		PRO.BASE_PRIORITY = Pro->BASE_PRIORITY;
% 		PRO.DEADLINE = Pro->DEADLINE;
% 		PRO.NAME = Pro->NAME;
       
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
		return;

	