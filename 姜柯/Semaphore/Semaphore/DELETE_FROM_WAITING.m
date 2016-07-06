function DELETE_FROM_WAITING(PROCESS_ID)

    global Waiting_Processes_set;
    for i=1:255
            if Waiting_Processes_set{1,i}==PROCESS_ID
                Waiting_Processes_set{1,i} = [];
                break;
            end
    end 
    disp('PROCESS DELETE FROM WAITING SUCCESS');
    
end

