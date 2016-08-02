function PROCESS_SCHEDULING()
    
    global Running_Processes_set;
    global Process_Set;
    global SYSTEM_NUMBER_OF_PROCESSES;
    global PCCounter;
    global Current_Process;
    global PROCESS_STATE_TYPE;
    
    
    if isempty(Current_Process) == 1
        FIND_SCHEDULED_PROCESS();
        for i = 1:SYSTEM_NUMBER_OF_PROCESSES
           if Process_Set{1,i}.ENTRY_POINT == PCCounter
                Process_Set{1,i}.PROCESS_STATE = PROCESS_STATE_TYPE.RUNNING;
                Current_Process = Process_Set{1,i};
                Running_Processes_set = Process_Set{1,i}.ID;
                DELETE_FROM_READY(Process_Set{1,i}.ID);
                return;
           else
                continue;
           end
        end
    else
        FIND_SCHEDULED_PROCESS(); 
        for i = 1:SYSTEM_NUMBER_OF_PROCESSES
            if Process_Set{1,i}.ID == Current_Process.ID
                PRO = Process_Set{1,i};
                index = i;
            else
                continue;
            end
        end
        
        for i = 1:SYSTEM_NUMBER_OF_PROCESSES
           if Process_Set{1,i}.ENTRY_POINT == PCCounter
               if Current_Process.CURRENT_PRIORITY >= Process_Set{1,i}.CURRENT_PRIORITY
                   Current_Process.ENTRY_POINT = PCCounter;
                   return;
               else
                   PRO.PROCESS_STATE = PROCESS_STATE_TYPE.READY;
                   Process_Set{1,index} = PRO;
                   INSERT_INTO_READY(Process_Set{1,index}.ID);
                   Process_Set{1,i}.PROCESS_STATE = PROCESS_STATE_TYPE.RUNNING;
                   Current_Process = Process_Set{1,i};
                   Running_Processes_set = Process_Set{1,i}.ID;
                   DELETE_FROM_READY(Process_Set{1,i}.ID);
                   return;
               end
           else
                continue;
           end
        end 
    end
        return;
   
   
end
