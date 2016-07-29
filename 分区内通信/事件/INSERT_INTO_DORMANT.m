function INSERT_INTO_DORMANT(PROCESS_ID)

    global Dormant_Processes_set;
    
    if sum(ismember(Dormant_Processes_set,PROCESS_ID)) >= 1
        return;
    else
        Dormant_Processes_set(1,numel(Dormant_Processes_set)+1) = PROCESS_ID;
    end
end

