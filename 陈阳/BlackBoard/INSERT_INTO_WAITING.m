function INSERT_INTO_WAITING(PROCESS_ID)

    global Waiting_Processes_set;
    for i=1:255
            if isempty(Waiting_Processes_set{1,i})
                Waiting_Processes_set{1,i} = PROCESS_ID;
                break;
            end
    end 
    %disp('PROCESS INSERT INTO WAITING SUCCESS');
    
end

