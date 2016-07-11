function PROCESS_SCHEDULING()
    
    global Ready_Processes_set;
    global Process_Set;
    global SYSTEM_NUMBER_OF_PROCESS;
    global PCCounter;
    global Current_Process;
    
    if Current_Process == []
        for i = 1:SYSTEM_NUMBER_OF_PROCESS
            if Process_Set{1,i}.ID == Ready_Processes_set(1)
                PCCounter = Process_Set{1,i}.ENTRY_POINT;
            else
                continue;
            end
        end
    else         
        for i = 1:numel(Ready_Processes_set)
            for j = 1:SYSTEM_NUMBER_OF_PROCESS
                    if Ready_Processes_set(i) == Process_Set{1,j}.ID
                        if Process_Set{1,j}.CURRENT_PRIORITY > Current_Process.CURRENT_PRIORITY
                            PCCounter = Process_Set{1,j}.ENTRY_POINT;
                        else
                            PCCounter = Current_Process.ENTRY_POINT;
                        end
                    else
                        continue;
                    end
            end
        end
    end
end
