function [RETURN_CODE]= SET_PRIORITY(PROCESS_ID,PRIORITY)
         global PROCESS_STATE_TYPE;
         global Process_Set;
         global RETURN_CODE_TYPE;

         if  INVALID_ID(PROCESS_ID) == 1  &&   Process_Set{1,PROCESS_ID}.PROCESS_STATE ~= PROCESS_STATE_TYPE.DORMANT
%              fprintf('ada');
             Process_Set{1,PROCESS_ID}.CURRENT_PRIORITY = PRIORITY;
             RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;	
         end
end
	 
			
		 	
