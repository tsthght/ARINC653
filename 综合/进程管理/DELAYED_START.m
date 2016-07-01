function RETURN_CODE = DELAYED_START(PROCESS_ID,DELAY_TIME)

        global PROCESS_STATE_TYPE;
        global RETURN_CODE_TPYE;
        global OPERATING_MODE_TYPE;
        global Process_ID_Set;
        global Process_NAME_Set;
        global Process_Set;
        global PAR;
        % error
  		flag=INVALID_ID(PROCESS_ID);
        if flag == 0
			RETURN_CODE = RETURN_CODE_TPYE.INVALID_PARAM;

			return
        end        
        
        if Process_Set{1,PROCESS_ID}.PROCESS_STATE ~= PROCESS_STATE_TYPE.DORMANT
			RETURN_CODE = RETURN_CODE_TPYE.NO_ACTION;

			return
        end        
		if DELAY_TIME<-9223372036854775808 || DELAY_TIME>9223372036854775807
            RETURN_CODE = RETURN_CODE_TPYE.INVALID_PARAM;

            return
        end
  		if Process_Set{1,PROCESS_ID}.PERIOD == 1 && DELAY_TIME >= Process_Set{1,PROCESS_ID}.PERIOD
            RETURN_CODE = RETURN_CODE_TPYE.INVALID_PARAM;

            return
        end
  		% normal
  		if Process_Set{1,PROCESS_ID}.PERIOD == 0
            Process_Set{1,PROCESS_ID}.BASE_PRIORITY = Process_Set{1,PROCESS_ID}.CURRENT_PRIORITY;			
            INITIALIZE_PROCESS_CONTEXT();
			INITIALIZE_PROCESS_STACK();			 
			if PAR.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL
				if DELAY_TIME == 0
					Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
                    DELETE_FROM_DORMANT(PROCESS_ID);
                    INSERT_INTO_READY(PROCESS_ID);% 将进程插入READY队列
					Process_Set{1,PROCESS_ID}.DEADLINE_TIME = 10 + Process_Set{1,PROCESS_ID}.TIME_CAPACITY;% CURRENT_SYSTEM_CLOCK()
                else
					Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
                    DELETE_FROM_DORMANT(PROCESS_ID);
                    INSERT_INTO_WAITING(PROCESS_ID);% 将进程插入WAITING队列
					Process_Set{1,PROCESS_ID}.DEADLINE_TIME = 10 + Process_Set{1,PROCESS_ID}.TIME_CAPACITY + DELAY_TIME;% CURRENT_SYSTEM_CLOCK() 
                end
				if PAR.LOCK_LEVEL == 0
    				PROCESS_SCHEDULING();% 请求进程调度
                end 
            else
				Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
                DELETE_FROM_DORMANT(PROCESS_ID);
				INSERT_INTO_WAITING(PROCESS_ID);% 将进程插入WAITING队列
            end
			RETURN_CODE = RETURN_CODE_TPYE.NO_ERROR;

			return  
        else
  			Process_Set{1,PROCESS_ID}.BASE_PRIORITY = Process_Set{1,PROCESS_ID}.CURRENT_PRIORITY;			
            INITIALIZE_PROCESS_CONTEXT();
			INITIALIZE_PROCESS_STACK();	
			if PAR.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL 
				Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
                DELETE_FROM_DORMANT(PROCESS_ID);
				INSERT_INTO_WAITING(PROCESS_ID);% 将进程插入WAITING队列			
				Process_Set{1,PROCESS_ID}.DEADLINE_TIME = 10 + Process_Set{1,PROCESS_ID}.TIME_CAPACITY;% FIRST_RELEASE_POINT()	
			else			
				Process_Set{1,PROCESS_ID}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
                DELETE_FROM_DORMANT(PROCESS_ID);
				INSERT_INTO_WAITING(PROCESS_ID);% 将进程插入WAITING队列	            
            end  
			RETURN_CODE = RETURN_CODE_TPYE.NO_ERROR;

			return
        end
end

