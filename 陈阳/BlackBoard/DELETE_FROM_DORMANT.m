function DELETE_FROM_DORMANT(PROCESS_ID)

    global Dormant_Processes_set;
    for i=1:255
            if Dormant_Processes_set{1,i}==PROCESS_ID
                Dormant_Processes_set{1,i} = [];
                break;
            end
    end 
    %disp('PROCESS DELETE FROM DORMANT SUCCESS');
    
end
