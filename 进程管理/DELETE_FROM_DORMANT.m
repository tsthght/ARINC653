function DELETE_FROM_DORMANT(PROCESS_ID)

    global Dormant_Processes_set;
    global MAX_NUMBER_OF_PROCESS;
    for i=1:MAX_NUMBER_OF_PROCESS
            if Dormant_Processes_set(i)==PROCESS_ID
                Dormant_Processes_set(i) = [];
                break;
            end
    end 
    
end
