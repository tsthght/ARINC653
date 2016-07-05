function [EVENT_ID,RETURN_CODE] = GET_EVENT_ID(EVENT_NAME)

global Event_Set;
global RETURN_CODE_TYPE;
global MAX_NUMBER_OF_EVENTS;


if EVENT_NAME_EXIST(EVENT_NAME)==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    return;
end

for i =1:MAX_NUMBER_OF_EVENTS
    if Event_Set{1,i}.NAME == EVENT_NAME;
        EVENT_ID = Event_Set{1,i}.ID;
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
    end
    return;
end