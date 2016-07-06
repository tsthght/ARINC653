function PROCESS_SCHEDULING()
    
    global Running_Processes_set;
    global Ready_Processes_set;
    global Process_Set;
    global MAX_NUMBER_OF_PROCESS;
    
    running_process=0;
    current_priority=0;
    location=0;
    
    for i=1:MAX_NUMBER_OF_PROCESS
        location=FIND_PROCESS_INDEX(Ready_Processes_set{1,i});
        if location ~= -1
            if Process_Set{1,location}.CURRENT_PRIORITY>current_priority
                running_process=Ready_Processes_set{1,i};
                current_priority=Process_Set{1,location}.CURRENT_PRIORITY; 
            end
        end
    end
    Running_Processes_set{1,1}=running_process;
end
