function DELETE_FROM_WAITING(PROCESS_ID)

    global Waiting_Processes_set;
    
    for i=1:numel(Waiting_Processes_set)
            if Waiting_Processes_set(i)==PROCESS_ID
                Waiting_Processes_set(i) = [];
                break;
            end
    end 
    
end

