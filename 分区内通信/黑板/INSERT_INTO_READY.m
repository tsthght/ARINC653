function INSERT_INTO_READY(PROCESS_ID)

    global Ready_Processes_set;
    
    if sum(ismember(Ready_Processes_set,PROCESS_ID)) >= 1
        return;
    else
        Ready_Processes_set(1,numel(Ready_Processes_set)+1) = PROCESS_ID;
    end
end

