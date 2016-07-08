function [RETURN_CODE]=RECEIVE_BUFFER ( BUFFER_ID,TIME_OUT )
	
		TEMP_LENGTH = 0;
  		TEMP_INDEX =1;
  		global PROCESS_STATE_TYPE;
        global TIMER_TYPE;
        global RETURN_CODE_TYPE;
  		if INVALID_ID(BUFFER_ID)==0
 			
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
		if INVALID_TIME_OUT(TIME_OUT) 
		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        return;
% 		if(~(@.<ID:BUFFER_ID> : Buffer_Set))
% 		{	
% 			*RETURN_CODE = INVALID_PARAM;
% 			return;
% 		}
		
% 		Buff.<ID:BUFFER_ID>:Buffer_Set;
		
if BUFF.NB_MESSAGE ~= 0 
        
            while TEMP_LENGTH < BUFF.FIRST_MESSAGE.LENGTH 
            
%                 MESSAGE_ADDR + TEMP_LENGTH = BUFF.FIRST_MESSAGE.MESSAGE_ADDR + TEMP_LENGTH;
%                 BUFF.FIRST_MESSAGE.MESSAGE_ADDR + TEMP_LENGTH = NULL;
                TEMP_LENGTH = TEMP_LENGTH + 1;
            
            end
 
            LENGTH = BUFF.FIRST_MESSAGE.LENGTH;
 
            if BUFF.NB_MESSAGE > 1
            
                BUFF.FIRST_MESSAGE = BUFF.FIRST_MESSAGE.NEXT;
                BUFFNB_MESSAGE = BUFF.NB_MESSAGE - 1;
            
            end
 
%             if(WBPro.<BUFFER_ID:Buff.ID, WAIT_TYPE:SENDING, INDEX:1> : Waiting_Buffer_Set)
%             
%                 TEMP_LENGTH = 0;
%                 Buff.LAST_MESSAGE = *(Buff.LAST_MESSAGE.NEXT);
%                 while(TEMP_LENGTH < WBPro.LENGTH)
%                 
%                     *(Buff.LAST_MESSAGE.MESSAGE_ADDR + TEMP_LENGTH) = *(WBPro.MESSAGE_ADDR + TEMP_LENGTH);
%                     TEMP_LENGTH = TEMP_LENGTH + 1;
%                 
%                 end
                
%                 if Timer.<ID:WBPro.ID> : Waiting_Timer_Set)
%                 
%                     _STOP_TIME_COUNTER(Timer); 
%                 end
                
%                 Pro.<ID:WBPro.ID> : Process_Set;
                PRO.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
                READY_PROCESS_SET = PRO.ID;
                
                Locate = find(PRO.ID);
                WAITING_PROCESS_SET(Locate) = [];
%               WAITING_BUFFER_SET -- {WBPro};
                
                          
 
%                 if(Current_Partition_STATUS.LOCK_LEVEL == 0)
%                     _Ask_For_Process_Scheduling();
%                 end
            
 
                 RETURN_CODE = NO_ERROR;
               
elseif TIME_OUT == 0
        
            LENGTH = 0;
            RETURN_CODE = NO_AVAILABLE;
            return;
        
%         else if Current_Partition_STATUS.LOCK_LEVEL != 0 || Current_Process.ID == ERROR_HANDLER_PROCESS_ID
%         
%             LENGTH = 0;
%             RETURN_CODE = INVALID_MODE;
%             return;
        
elseif TIME_OUT == INFINITE_TIME_VALUE 
        
%             Current_Process.PROCESS_STATE = WAITING;
 
            RUNNING_PROCESS_SET(Locate)=[];
            WAITING_PROCESS_SET(length(WAITING_PROCESS_SET)+1) = PRO.ID;
            
%             WAITING_PROCESS_SET ++ {<Current_Process.ID, Buff.ID, RECEVING, 
%                                     MESSAGE_ADDR, LENGTH, Buff.LAST_RECEVIE_INDEX + 1>};
            BUFF.LAST_RECEVIE_INDEX = BUFF.LAST_RECEVIE_INDEX + 1;
            
%             _Ask_For_Process_Scheduling();
            
            RETURN_CODE = NO_ERROR;
            return;
        
else
        
            PRO.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
            RUNNING_PROCESS_SET(Locate)=[];
            WAITING_PROCESS_SET(length(WAITING_PROCESS_SET)+1) = PRO.ID;;
            
%             Waiting_Buffer_Set ++ {<Current_Process.ID, Buff.ID, RECEVING, 
%                                     MESSAGE_ADDR, LENGTH, Buff.LAST_RECEVIE_INDEX + 1>};
            BUFF.LAST_RECEVIE_INDEX = BUFF.LAST_RECEVIE_INDEX + 1;
            
%             _CREATE_TIME_COUNTER(TIME_OUT, Current_Process.ID, *Time_Out_Signal);
            
%             _Ask_For_Process_Scheduling();      
            
            if Time_Out_Signal == TIMER_TYPE.TRUE
            
                LENGTH = 0;
                RETURN_CODE = TIMED_OUT;
                return;
            
            else
            
                RETURN_CODE = NO_ERROR;
                return;
            
            end
 end



