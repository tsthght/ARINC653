function FIND_SCHEDULED_PROCESS()

    global Process_Set;
    global SYSTEM_NUMBER_OF_PROCESSES;
    global PCCounter;


        RP = cell(0);
        count = 0;
        for i = 1:SYSTEM_NUMBER_OF_PROCESSES
            if Process_Set{1,i}.PROCESS_STATE == 1
                count = count + 1;
                RP{1,count} = Process_Set{1,i};
            else
                continue;
            end
        end
        
        max = 0;
        for i = 1:count
             if RP{1,i}.CURRENT_PRIORITY > max
                 max = RP{1,i}.CURRENT_PRIORITY;
                 PCCounter = RP{1,i}.ENTRY_POINT;
             else
                 continue;
             end
        end
        return;
end