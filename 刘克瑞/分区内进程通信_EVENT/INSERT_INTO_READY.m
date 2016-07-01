function INSERT_INTO_READY(PROCESS_ID)

    global Ready_Processes_set;
    for i=1:255
            if isempty(Ready_Processes_set{1,i}) == 0 
                if Ready_Processes_set{1,i} == PROCESS_ID;
                    disp(['PROCESS',' ',num2str(PROCESS_ID), 'ALREAY IN READY_PROCESSES_SET!']);
                return; 
                end
            end
         
    end 
   
     for i=1:255
         if isempty(Ready_Processes_set{1,i}) == 1
            Ready_Processes_set{1,i} = PROCESS_ID;
            disp(['PROCESS',' ',num2str(PROCESS_ID),' INSERT INTO READY_PROCESSES_SET SUCCESSFULLY!']);
            return;
         end
     end
    
end

