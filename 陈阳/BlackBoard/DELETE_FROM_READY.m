function DELETE_FROM_READY(PROCESS_ID)

    global Ready_Processes_set;
    for i=1:255
            if Ready_Processes_set{1,i}==PROCESS_ID
                Ready_Processes_set{1,i} = [];
                break;
            end
    end 
    %disp('PROCESS DELETE FROM READY SUCCESS');
    
end
