function INSERT_INTO_WAITING(PROCESS_ID)

    global Waiting_Processes_set;
    
    Waiting_Processes_set(numel(Waiting_Processes_set)+1) = PROCESS_ID;
    
end

