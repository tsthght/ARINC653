function PROCESS_SCHEDULING(PROCESS_ID,location)
    
    global Running_Processes_set;
    global Ready_Processes_set;
    global Process_Set;
    loc=-1;
    running_process=PROCESS_ID;
    current_priority=Process_Set{1,location}. 
    
    for i=1:255
            if ~isempty(Ready_Processes_set{1,i})
                loc=0;
                for j=1:255CURRENT_PRIORITY;
                    if ~isempty(Process_Set{1,j})
                        if Process_Set{1,j}.ID == Ready_Processes_set{1,i};
                            loc=j;
                            break;
                        end
                    end
                end
                if Process_Set{1,loc}.CURRENT_PRIORITY>current_priority
                    running_process=Ready_Processes_set{1,i};
                    current_priority=Process_Set{1,loc}.CURRENT_PRIORITY; 
                end
            end
    end
    Running_Processes_set{1,1}=running_process;
end
