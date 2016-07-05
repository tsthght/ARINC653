function DELETE_FROM_READY(PROCESS_ID)

    global Ready_Processes_set;
    global MAX_NUMBER_OF_PROCESS;
    for i=1:MAX_NUMBER_OF_PROCESS
            if Ready_Processes_set(i)==PROCESS_ID
                Ready_Processes_set(i) = [];
                break;
            end
    end 
    
end
