function DELETE_FROM_DORMANT(PROCESS_ID)

    global Dormant_Processes_set;

    if numel(Dormant_Processes_set)~= 0
        for i=1:numel(Dormant_Processes_set)
            if Dormant_Processes_set(i)==PROCESS_ID
                Dormant_Processes_set(i) = [];
                break;
            end
        end 
    end
    
end
