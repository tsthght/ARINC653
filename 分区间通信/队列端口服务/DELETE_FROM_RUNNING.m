function DELETE_FROM_RUNNING(PROCESS_ID)

    global Running_Processes_set;
    
    if numel(Running_Processes_set)~= 0
        for i=1:numel(Running_Processes_set)
            if Ready_Processes_set(i)==PROCESS_ID
                Running_Processes_set(i) = [];
                break;
            end
        end
    end

    
end
