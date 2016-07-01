function INSERT_INTO_WAITING(PROCESS_ID)

    global Waiting_Processes_set;
    
   for i=1:255
            if isempty(Waiting_Processes_set{1,i}) == 0 
                if Waiting_Processes_set{1,i} == PROCESS_ID;
                    disp(['PROCESS',' ',num2str(PROCESS_ID), 'ALREAY IN WAITING_PROCESSES_SET!']);
                return; 
                end
            end
         
    end 
   
     for i=1:255
         if isempty(Waiting_Processes_set{1,i}) == 1
            Waiting_Processes_set{1,i} = PROCESS_ID;
            disp(['PROCESS',' ',num2str(PROCESS_ID),' INSERT INTO WAITING_PROCESSES_SET SUCCESSFULLY!']);
            return;
         end
     end
    
    
end

