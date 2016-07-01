function INSERT_INTO_DORMANT(PROCESS_ID)

    global Dormant_Processes_set;
    for i=1:255
            if isempty(Dormant_Processes_set{1,i}) == 0 
                if Dormant_Processes_set{1,i} == PROCESS_ID;
                    disp(['PROCESS',' ',num2str(PROCESS_ID), 'ALREAY IN DORMANT_PROCESSES_SET!']);
                return; 
                end
            end
         
    end 
   
     for i=1:255
         if isempty(Dormant_Processes_set{1,i}) == 1
            Dormant_Processes_set{1,i} = PROCESS_ID;
            disp(['PROCESS',' ',num2str(PROCESS_ID),' INSERT INTO DORMANT_PROCESSES_SET SUCCESSFULLY!']);
            return;
         end
     end
   
end

