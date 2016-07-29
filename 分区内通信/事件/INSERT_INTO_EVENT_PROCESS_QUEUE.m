function [RETURN_CODE] = INSERT_INTO_EVENT_PROCESS_QUEUE(PROCESS_ID,EVENT_ID)

global Event_Set;
global RETURN_CODE_TYPE;
global SYSTEM_NUMBER_OF_EVENTS;

    for i = 1:SYSTEM_NUMBER_OF_EVENTS
        if Event_Set{1,i}.ID == EVENT_ID
            if sum(ismember(Event_Set{1,i}.WAITING_PROCESSES,PROCESS_ID)) >= 1
                return;
            else
                Event_Set{1,i}.WAITING_PROCESSES(numel(Event_Set{1,i}.WAITING_PROCESSES)+1) = PROCESS_ID;
                RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
                break;
            end
        else 
            continue;
        end
    end
end
        
        