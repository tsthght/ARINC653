function [RETURN_CODE] = RESET_EVENT(EVENT_ID)

global RETURN_CODE_TYPE;
global Event_Set;
global EVENT_STATE_TYPE;
global SYSTEM_NUMBER_OF_EVENTS;

if EVENT_ID_EXIST(EVENT_ID) == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    return;
end
    
for i = 1:SYSTEM_NUMBER_OF_EVENTS
    if  Event_Set{1,i}.ID == EVENT_ID
        if Event_Set{1,i}.STATE == EVENT_STATE_TYPE.DOWN
            RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
            return;
        else 
            Event_Set{1,i}.STATE = EVENT_STATE_TYPE.DOWN;
            RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
            break;
        end
    else
        continue;
    end
end

    