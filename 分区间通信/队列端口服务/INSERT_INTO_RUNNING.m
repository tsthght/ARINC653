function INSERT_INTO_RUNNING(PROCESS_ID)

    global Running_Processes_set;
    for i=1:255
            if isempty(Running_Processes_set{1,i})
                Running_Processes_set{1,i} = PROCESS_ID;
                break;
            end
    end 
    disp('PROCESS INSERT INTO Running SUCCESS');
    
end

