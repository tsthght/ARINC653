function [RETURN_CODE]=RECEIVE_BUFFER ( BUFFER_ID,TIME_OUT, MESSAGE_ADDR )
	
		TEMP_LENGTH = 0;
  		TEMP_INDEX =1;
  		global PROCESS_STATE_TYPE;
        global TIMER_TYPE;
        global RETURN_CODE_TYPE;
        global Buffer_set;
        global Current_Partition_STATUS
        global INFINITE_TIME_VALUE;
        global Time_Out_Signal

  		if INVALID_ID(BUFFER_ID)==0
 			
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
		if INVALID_TIME_OUT(TIME_OUT) 
		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
      
        
%         RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
%         return;
% 		if(~(@.<ID:BUFFER_ID> : Buffer_Set))
% 		{	
% 			*RETURN_CODE = INVALID_PARAM;
% 			return;
% 		}
		
% 		Buff.<ID:BUFFER_ID>:Buffer_Set;
        index=FIND_BUFFER_INDEX( BUFFER_ID );
    
  		BUFF=Buffer_set{1,index};
        
if BUFF.NB_MESSAGE ~= 0 
             
            LENGTH  = PASTE(BUFFER_ID,MESSAGE_ADDR);
      
            if BUFF.NB_MESSAGE > 1
            
                BUFF.FIRST_MESSAGE = BUFF.FIRST_MESSAGE.NEXT;
                BUFFNB_MESSAGE = BUFF.NB_MESSAGE - 1;
            
            end
             
            index=FIND_BUFFER_INDEX( BUFFER_ID );
            if(index <= 0)
            
                TEMP_LENGTH = 0;
                
                while(TEMP_LENGTH < WBPro.LENGTH)
                
                    LENGTH  = PASTE(BUFFER_ID,MESSAGE_ADDR);
                    TEMP_LENGTH = TEMP_LENGTH + 1;
                
                end
                
%                 if Timer.<ID:WBPro.ID> : Waiting_Timer_Set)
%                 
%                     _STOP_TIME_COUNTER(Timer); 
%                 end
                
               
                PRO.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
                READY_PROCESS_SET = PRO.ID;
                
                Locate = find(PRO.ID);
                WAITING_PROCESS_SET(Locate) = [];

                
                       
 
                if(Current_Partition_STATUS.LOCK_LEVEL == 0)
                    Ask_For_Process_Scheduling=1;
                end
            
 
                 RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
              
elseif TIME_OUT == 0
        
            LENGTH = 0;
            RETURN_CODE = RETURN_CODE_TYPE.NO_AVAILABLE;
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
            
            RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
            return;
        
else
        
            PRO.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
%             RUNNING_PROCESS_SET(Locate)=[];
%             WAITING_PROCESS_SET(length(WAITING_PROCESS_SET)+1) = PRO.ID;;
            
%             Waiting_Buffer_Set ++ {<Current_Process.ID, Buff.ID, RECEVING, 
%                                     MESSAGE_ADDR, LENGTH, Buff.LAST_RECEVIE_INDEX + 1>};
%             BUFF.LAST_RECEVIE_INDEX = BUFF.LAST_RECEVIE_INDEX + 1;
            
%             _CREATE_TIME_COUNTER(TIME_OUT, Current_Process.ID, *Time_Out_Signal);
            
%             _Ask_For_Process_Scheduling();      
            
            if Time_Out_Signal == TIMER_TYPE.TRUE
            
                LENGTH = 0;
                RETURN_CODE = RETURN_CODE_TYPE.TIMED_OUT;
                return;
            
            else
            
                RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
                return;
            
            end
 end

 RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
end
