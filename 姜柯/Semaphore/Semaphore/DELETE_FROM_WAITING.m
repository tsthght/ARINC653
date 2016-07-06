function DELETE_FROM_WAITING(PROCESS_ID)

    global Waiting_Processes_set;
    global MAX_NUMBER_OF_PROCESS;
    for i=1:MAX_NUMBER_OF_PROCESS
            if Waiting_Processes_set(i)==PROCESS_ID
                Waiting_Processes_set(i) = [];
                break;
            end
    end 
    
end

