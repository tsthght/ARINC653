function TIMER_SCHEDULE(obj,event)

%T = timer('TimerFcn',@TIMER_SCHEDULE, 'Period', 3,'executionmode','fixeddelay','TasksToExecute',100000)
    global Running_Processes_set;
    global Process_Set;
    global SYSTEM_NUMBER_OF_PROCESSES;
    global PCCounter;
    global Current_Process;
    global PROCESS_STATE_TYPE;
    global Ready_Processes_set;
    
    
        count = 0;
        
        for j = 1:numel(Ready_Processes_set)
            for i = 1:SYSTEM_NUMBER_OF_PROCESSES
                if Process_Set{1,i}.ID == Ready_Processes_set(j)
                    count = count + 1;
                    RP{1,count} = Process_Set{1,i};
                else
                    continue;
                end
            end
        end
        
        for i = 1:SYSTEM_NUMBER_OF_PROCESSES
            if Process_Set{1,i}.ID == Current_Process.ID
                PRO = Process_Set{1,i};
                index = i;
            else
                continue;
            end
        end
        PRO.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
        INSERT_INTO_READY(PRO.ID);
        Process_Set{1,index} = PRO;
        RP{1,numel(RP)+1} = PRO;
        
        PCCounter = RP{1,1}.ENTRY_POINT;     
        RP{1,1}.PROCESS_STATE = PROCESS_STATE_TYPE.RUNNING;
        DELETE_FROM_READY(RP{1,1}.ID);  
        Current_Process = RP{1,1};
        Running_Processes_set = RP{1,1}.ID;
        for i = 1:SYSTEM_NUMBER_OF_PROCESSES
            if Process_Set{1,i}.ID == RP{1,1}.ID;
                Process_Set{1,i} = RP{1,1};
            else
                continue;
            end
        end

           
        
        return;

end