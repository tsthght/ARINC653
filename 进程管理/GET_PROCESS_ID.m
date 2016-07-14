function [RETURN_CODE,PROCESS_ID]=GET_PROCESS_ID (PROCESS_NAME)   

        global RETURN_CODE_TYPE;
        global Process_Set;
        global SYSTEM_NUMBER_OF_PROCESSES;


        if INVALIDE_NAME(PROCESS_NAME) == 0
		 	RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            PROCESS_ID = -1;
			return;
        end
         		
        id = 0;
 		for i = 1:SYSTEM_NUMBER_OF_PROCESSES 
            if strcmp( Process_Set{1,i}.NAME,PROCESS_NAME ) == 1
                id = Process_Set{1,i}.ID;
                break;
            else
                continue;
            end
        end
        
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        PROCESS_ID = id;
end
