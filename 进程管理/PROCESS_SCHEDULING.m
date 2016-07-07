function PROCESS_SCHEDULING()
    
    global Running_Processes_set;
    global Ready_Processes_set;
    global Process_Set;
    global SYSTEM_NUMBER_OF_PROCESS;
    global Current_Process;
    
    
    for i = 1:numel(Ready_Processes_set)
        for j = 1:SYSTEM_NUMBER_OF_PROCESS
                if Ready_Processes_set(i) == Process_Set{1,j}.ID
                    if Process_Set{1,j}.CURRENT_PRIORITY > Current_Process.CURRENT_PRIORITY
                        CP = Process_Set{1,j};
                        RP =  Process_Set{1,j}.ID;
                    else
                        CP = Current_Process;
                        RP = Current_Process.ID;
                    end
                else
                    continue;
                end
        end
    end
    Current_Process = CP;
    Running_Processes_set = RP;
end
