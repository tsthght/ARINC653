function INSERT_INTO_READY(PROCESS_ID)

    global Ready_Processes_set;
    for i=1:255
            if isempty(Ready_Processes_set{1,i})
                Ready_Processes_set{1,i} = PROCESS_ID;
                break;
            end
    end 
   % disp('PROCESS INSERT INTO READY SUCCESS');
    
end

