function DELETE_FROM_RUNNING(PROCESS_ID)

    global Running_Processes_set;
    for i=1:255
            if Running_Processes_set{1,i}==PROCESS_ID
                Running_Processes_set{1,i} = [];
                break;
            end
    end 
    disp('PROCESS DELETE FROM RUNNING SUCCESS');
    
end
