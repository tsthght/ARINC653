function [RETURN_CODE,PROCESS_ID]=GET_PROCESS_ID (PROCESS_NAME)
        global ID;
        
        global RETURN_CODE_TYPE;
        global Process_Set;
        global MAX_NUMBER_OF_PROCESS;


        if INVALIDE_NAME(PROCESS_NAME) == 0
 			
		 	RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
         
%          x=INVALIDE_NAME(PROCESS_NAME);
% 		if x==1
% 			
% 			RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
% 			return;
%         end
		

 		for i = 1:MAX_NUMBER_OF_PROCESS 
            if  isempty( Process_Set{1,i} ) == 0
                if strcmp( Process_Set{1,i}.NAME,PROCESS_NAME ) == 1
                     ID = Process_Set{1,i}.ID;
                end
            end
        end
        
 	    PROCESS_ID = ID;
		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        
end
