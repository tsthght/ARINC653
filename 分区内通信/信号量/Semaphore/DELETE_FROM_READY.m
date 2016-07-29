function DELETE_FROM_READY(PROCESS_ID)

    global Ready_Processes_set;

    if numel(Ready_Processes_set)~= 0
        for i=1:numel(Ready_Processes_set)
            if Ready_Processes_set(i)==PROCESS_ID
                Ready_Processes_set(i) = [];
                break;
            end
        end
    end
    
end
