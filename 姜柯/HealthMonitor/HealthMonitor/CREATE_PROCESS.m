function RETURN_CODE = CREATE_PROCESS(ATTRIBUTE)
         
         global Process_ID_Set;
         global Process_NAME_Set;
         global Process_Set;
         global RETURN_CODE_TYPE;
         global PROCESS_STATE_TYPE;
         global OPERATING_MODE_TYPE;
         global PAR;         
         %error              
         flag=INVALID_NAME(ATTRIBUTE.NAME);
         if flag==1
             RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
             disp(RETURN_CODE);
             return
         end
         
         if ATTRIBUTE.STACK_SIZE<0 || ATTRIBUTE.STACK_SIZE>31
             RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
             disp(RETURN_CODE);
             return
         end
         
         if ATTRIBUTE.BASE_PRIORITY<0 || ATTRIBUTE.BASE_PRIORITY>31
             RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
             disp(RETURN_CODE);
	         return
         end

         if ATTRIBUTE.PERIOD<0 || ATTRIBUTE.PERIOD>63
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            disp(RETURN_CODE);
	        return
         end
		
         if ATTRIBUTE.TIME_CAPACITY<0 || ATTRIBUTE.TIME_CAPACITY>63
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            disp(RETURN_CODE);
	        return
         end
                          
         if ATTRIBUTE.TIME_CAPACITY > ATTRIBUTE.PERIOD
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
            disp(RETURN_CODE);
	        return
         end
    
         if(PAR.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL)
            RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
            disp(RETURN_CODE);
            return
         end
		 %normal
         %ID at 1 rang 1..255;
         %DEADLINE_TIME at 0 range 0..63;
         %CURRENT_PRIORITY at 8 range 0..31;
         %PROCESS_STATE at 12 range 0..31;
         %PERIOD at 0 range 0..63;
         %TIME_CAPACITY at 8 range 0..63;
         %ENTRY_POINT at 16 range 0..31;
         %STACK_SIZE at 20 range 0..31;
         %BASE_PRIORITY at 24 range 0..31;
         %DEADLINE at 28 range 0..31;
         %NAME at 32 range 0..30*8-1;
         
         %查找Process_Set为空的单元，该单元就是新创建进程pcb插入的单元
         num=0;
         for i=1:255
            if isempty(Process_Set{1,i});
                num=i;
                break;
            end
         end 
         
         PRO = PROCESS_ATTRIBUTE_TYPE(1,63,31,31,63,63,31,31,31,31,239);%进程初始化时默认赋值
         PRO.ID = num;%进程ID号依次增加
         PRO.DEADLINE_TIME = ATTRIBUTE.DEADLINE_TIME; 
         PRO.CURRENT_PRIORITY = ATTRIBUTE.CURRENT_PRIORITY;
         PRO.PROCESS_STATE = PROCESS_STATE_TYPE.DORMANT;
         PRO.PERIOD = ATTRIBUTE.PERIOD;
         PRO.TIME_CAPACITY = ATTRIBUTE.TIME_CAPACITY;
         PRO.ENTRY_POINT = ATTRIBUTE.ENTRY_POINT;
         PRO.STACK_SIZE = ATTRIBUTE.STACK_SIZE;
         PRO.BASE_PRIORITY = ATTRIBUTE.BASE_PRIORITY;
         PRO.DEADLINE = ATTRIBUTE.DEADLINE;
         PRO.NAME = ATTRIBUTE.NAME;
         
         INSERT_INTO_DORMANT(PRO.ID);% 将进程插入DORMANT队列
         INITIALIZE_PROCESS_CONTEXT();
		 INITIALIZE_PROCESS_STACK();			
		 %把新创建的进程pcb插入到Process_Set中，并且进程的ID和NAME插入到Process_ID_Set和Process_NAME_Set中，并且注意其位置是和Process_Set中是一致的，方便以后的程序检索用！         
         Process_Set{1,num} = PRO;
         Process_ID_Set{1,num} = PRO.ID;
         Process_NAME_Set{1,num} = PRO.NAME;
                               
         RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
         disp(RETURN_CODE);
        
end




        
 