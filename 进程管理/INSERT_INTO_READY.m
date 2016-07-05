function INSERT_INTO_READY(PROCESS_ID)

    global Ready_Processes_set;
    
    Ready_Processes_set(1,numel(Ready_Processes_set)+1) = PROCESS_ID;
    
end

