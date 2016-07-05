function [EVENT_STATUS, RETURN_CODE] = GET_EVENT_STATUS(EVENT_ID)

global Event_Set;
global RETURN_CODE_TYPE;
global MAX_NUMBER_OF_EVENTS;

if EVENT_ID_EXIST(EVENT_ID) == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    return;
end

for i =1:MAX_NUMBER_OF_EVENTS
    if Event_Set{1,i}.ID == EVENT_ID
        EVENT_STATUS.STATE = Event_Set{1,i}.STATE;
        EVENT_STATUS.WP = Event_Set{1,i}.WAITING_PROCESSES;
        RETURN_CODE =RETURN_CODE_TYPE.NO_ERROR;
        return;
    end
end
            