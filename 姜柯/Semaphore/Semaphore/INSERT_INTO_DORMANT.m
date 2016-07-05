function INSERT_INTO_DORMANT(PROCESS_ID)

    global Dormant_Processes_set;
    for i=1:255
            if isempty(Dormant_Processes_set{1,i})
                Dormant_Processes_set{1,i} = PROCESS_ID;
                break;
            end
    end 
    disp('PROCESS INSERT INTO DORMANT SUCCESS');
    
end

