function INSERT_INTO_WAITING(PROCESS_ID)

    global Waiting_Processes_set;
    
    if sum(ismember(Waiting_Processes_set,PROCESS_ID)) >= 1
        return;
    else
       Waiting_Processes_set(numel(Waiting_Processes_set)+1) = PROCESS_ID;
    end
    
end

