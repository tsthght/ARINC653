function [RETURN_CODE]=SEND_BUFFER (BUFFER_ID,MESSAGE_ADDR,LENGTH,TIME_OUT)

        TEMP_LENGTH = 0;
        TEMP_INDEX = 1;
  		global PROCESS_STATE_TYPE
        global GLOBAL_BUFFER_ZONE
        global Ready_Processes_set
        global Waiting_Processes_set
        global Current_Partition_STATUS
        global Waiting_Buffer_Set
        global Running_Processes_set
        global RETURN_CODE_TYPE
        global BUFFER_ATTRIBUTE
        global Process_Set
        global SYSTEM_LIMIT_NUMBER_OF_BUFFERS
  		if INVALID_ID(BUFFER_ID)==0 
          
			RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
			return;
        end
        
% 		if(~(@.<ID:BUFFER_ID> : Buffer_Set))
% 		{	
% 			*RETURN_CODE = INVALID_PARAM;
% 			return;
% 		}
% 		
% 		Buff.<ID:BUFFER_ID>:Buffer_Set;
  		
		if INVALID_LENGTH(LENGTH, BUFFER_ATTRIBUTE.MAX_MESSAGE_SIZE)==1
		    
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
		if INVALID_MESSAGE_ADDR(MESSAGE_ADDR) == 1
		    
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
		if INVALID_TIME_OUT(TIME_OUT) 
		    
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
  		
  		BUFF=Waiting_Buffer_Set{BUFFER_ID,1};
      	if BUFF.NB_MESSAGE < BUFF.MAX_NB_MESSAGE 
         
            if BUFF.WAITING_PROCESSES == 0 && BUFF.NB_MESSAGE == 0 
             
                while TEMP_LENGTH < LENGTH  
                 
%                       BUFF.FIRST_MESSAGE.MESSAGE_ADDR + TEMP_LENGTH  = MESSAGE_ADDR + TEMP_LENGTH;
                    TEMP_LENGTH = TEMP_LENGTH + 1;
                end
                BUFF.FIRST_MESSAGE.LENGTH = LENGTH;
            
            else
            
%                   WBPro.<BUFFER_ID:Buff.ID, WAIT_TYPE:RECEIVING, INDEX:1> :  Waiting_Buffer_Set;
                
                while TEMP_LENGTH < LENGTH  
                
%                        WBPro.MESSAGE_ADDR + TEMP_LENGTH  =  MESSAGE_ADDR + TEMP_LENGTH ;
                    TEMP_LENGTH = TEMP_LENGTH + 1;
                end
                
%                   if(Timer.<ID:WBPro.ID> : Waiting_Timer_Set)
%                   
%                       _STOP_TIME_COUNTER(Timer); 
           
               
                for j=1:SYSTEM_LIMIT_NUMBER_OF_BUFFERS 
                    if ~isempty( Waiting_Buffer_Set{1,j} )
                        i = j;
                    end
                end
            
                id = Waiting_Buffer_Set{1,i}.ID;
                for i= 1:SYSTEM_LIMIT_NUMBER_OF_BUFFERS 
                    if id == Process_Set{1,i}.ID
                        PRO = Process_Set{1,i};
                        break;
                    end
                end
                
                PRO.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
              
                Ready_Processes_set{1,length(Ready_Processes_set)+1} = PRO.ID;
                Waiting_Processes_set{1,length(Waiting_Processes_set)+1} = PRO.ID;
                Locate = find(PRO.ID);
                Waiting_Processes_set(Locate) = [];
                
%                   if(Current_Partition_STATUS.LOCK_LEVEL == 0)
%                   _Ask_For_Process_Scheduling();
%           }
                 RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
                 return;
            end
        
        elseif(TIME_OUT == 0)
     
              RETURN_CODE = RETURN_CODE_TYPE.NO_AVAILABLE;
              return;
        
        elseif Current_Partition_STATUS.LOCK_LEVEL ~= 0 || PRO.ID == ERROR_HANDLER_PROCESS_ID
        
                RETURN_CODE = PROCESS_STATE_TYPE.INVALID_MODE;
                return;
        
        elseif(TIME_OUT == INFINITE_TIME_VALUE)
                  PRO.PROCESS_STATE = RETURN_CODE_TYPE.WAITING;
                  Running_Processes_set (Locate) = [];
                  Waiting_Processes_set (length(Waiting_Processes_set)+1) = PRO.ID;
            
                 
                  BUFF.LAST_SEND_INDEX = BUFF.LAST_SEND_INDEX + 1;
            
%             _Ask_For_Process_Scheduling();
            
                  RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
                  return;
        
        else
        
            PRO.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
            Running_Process_Set(Locate) = [];
            Waiting_Process_Set(length(Waiting_Process_Set)+1) = PRO.ID;
            
%             Waiting_Buffer_Set ++ {<Current_Process.ID, Buff.ID, SENDING, 
%                                     MESSAGE_ADDR, LENGTH, Buff.LAST_SEND_INDEX + 1>};
            BUFF.LAST_SEND_INDEX = BUFF.LAST_SEND_INDEX + 1;
            
%             CREATE_TIME_COUNTER(TIME_OUT, PRO.ID, *Time_Out_Signal);
            
%             _Ask_For_Process_Scheduling();      
%             
            if(Time_Out_Signal == TRUE)
            
                RETURN_CODE = PROCESS_STATE_TYPE.TIMED_OUT;
                return;
            
            else
            
                RETURN_CODE = PROCESS_STATE_TYPE.NO_ERROR;
                return;
            end
        end
         


