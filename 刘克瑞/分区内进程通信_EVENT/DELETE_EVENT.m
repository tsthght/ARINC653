function [RETURN_CODE] = DELETE_EVENT(EVENT_NAME)

global Event_Set;
global SYSTEM_NUMBER_OF_EVENTS;
global RETURN_CODE_TYPE;

if EVENT_NAME_EXIST(EVENT_NAME) == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    return;
end


for i = 1:SYSTEM_NUMBER_OF_EVENTS
    if strcmp(Event_Set{1,i}.NAME,EVENT_NAME) == 1
        Event_Set(i) = [];
        SYSTEM_NUMBER_OF_EVENTS = SYSTEM_NUMBER_OF_EVENTS - 1;
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
        break;
    else
        continue;
    end
end