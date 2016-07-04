function [RETURN_CODE]=CREATE_PROCESS(ATTRIBUTES)
         global Process_ID_Set;  
         global RETURN_CODE_TYPE;
         global PROCESS_STATE_TYPE;
         global Process_Set;
         global Dormant_Processes_set;
         global MAX_NUMBER_OF_PROCESS
         global MIN_PRIORITY_VALUE;
         global MAX_PRIORITY_VALUE;
         global SYSTEM_TIME_TYPE;
         global Current_Partition_STATUS;
         global OPERATING_MODE_TYPE;
%          global OPERATING_MODE_TYPE;
%          global CURRENT_PARTITION_STATUS;

         if NUMBER_OF_PROCESS() == MAX_NUMBER_OF_PROCESS
             RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
             return;
         end

         if INVALIDE_NAME(ATTRIBUTES.NAME) == 1
             RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
             return;
         end
         
         if ATTRIBUTES.STACK_SIZE<0 || ATTRIBUTES.STACK_SIZE>MAX_NUMBER_OF_PROCESS %全局变量来代替数值
             RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
             return;
         end
         
        if ATTRIBUTES.BASE_PRIORITY<MIN_PRIORITY_VALUE || ATTRIBUTES.BASE_PRIORITY>MIN_PRIORITY_VALUE>MAX_PRIORITY_VALUE
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
%         L=0;
%         for i=1:MAX_NUMBER_OF_PROCESS 
%             if ~isempty(Process_Set{1,i})
%                 L = L+1;
%             end
%         end
        id =  round( 1+(MAX_NUMBER_OF_PROCESS-1) *rand(1,1) );
       
        DORMANT = PROCESS_STATE_TYPE.DORMANT;
        
      
        PRO = PROCESS_TYPE(id,ATTRIBUTES.NAME,ATTRIBUTES.PERIOD,ATTRIBUTES.STACK_SIZE,1,DORMANT,ATTRIBUTES.PERIOD,ATTRIBUTES.TIME_CAPACITY, ATTRIBUTES.ENTRY_POINT, ATTRIBUTES.STACK_SIZE,  ATTRIBUTES.BASE_PRIORITY,ATTRIBUTES.DEADLINE);
        
        
        
        
        global ID
        ID = PRO.ID;
%       fprintf('sad is %d\n',ID);
        
        
        if INVALID_ID(ID)==1
           
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
	        return;
        end
    

        
       
        PRO.NAME = ATTRIBUTES.NAME;
        PRO.PERIOD = ATTRIBUTES.PERIOD;
        PRO.TIME_CAPACITY = ATTRIBUTES.TIME_CAPACITY ;
        %PRO.ENTRY_POINT = PROCESS_ATTRIBUTE_TYPE.ENTRY_POINT;
        PRO.STACK_SIZE = ATTRIBUTES.STACK_SIZE;
        PRO.BASE_PRIORITY = ATTRIBUTES.BASE_PRIORITY;
        PRO.DEADLINE = ATTRIBUTES.DEADLINE;
        PRO.PROCESS_STATE = PROCESS_STATE_TYPE.DORMANT;

        %Initialize_Process_Context(Pro->ID);
        %Initialize_Process_Stack(Pro->ID); 
		
        
        %PRO = PROCESS_TYPE(id)
         
%         Process_ID_Set(id) = id;
%        % fprintf('sdfsdf\n')
%          Process_NAME_Set{1,id} = PROCESS_ATTRIBUTE_TYPE.NAME;
        
        for i = 1:MAX_NUMBER_OF_PROCESS 
            if isempty( Process_Set{1,i} )
                Process_Set{1,i} = PRO;
                Dormant_Processes_set{1,i} = PRO.ID;
               break;
            end
        end
        
        
        %Dormant_Processes_set=Dormant_Processes_set \-/ {Pro->ID};
				
        PROCESS_ID = PRO.ID;
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        
end




        
 