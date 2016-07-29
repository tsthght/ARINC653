function SHUT_DOWN_PARTITION()

global Current_Partition_STATUS;
global Process_Set;
global SYSTEM_NUMBER_OF_PROCESSES;
global PROCESS_STATE_TYPE;

    for i = 1:SYSTEM_NUMBER_OF_PROCESSES
        if Process_Set{1,i}.PARID == Current_Partition_STATUS.IDENTIFIER
            Process_Set{1,i}.PROCESS_STATE = PROCESS_STATE_TYPE.DORMANT;
        else
            continue;
        end
    end
    
end