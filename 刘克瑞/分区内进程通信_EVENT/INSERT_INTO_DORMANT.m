function INSERT_INTO_DORMANT(PROCESS_ID)

    global Dormant_Processes_set;
    
    Dormant_Processes_set(1,numel(Dormant_Processes_set)+1) = PROCESS_ID;
    
end

