function [EVENT_ID,RETURN_CODE] = GET_EVENT_ID(EVENT_NAME)

global Event_Set;
global RETURN_CODE_TYPE;


flag = EVENT_NAME_EXIST(EVENT_NAME);
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG
    return;
end

for i =1:255
    if Event_Set{1,i}.NAME == EVENT_NAME;
        EVENT_ID = Event_Set{1,i}.ID
        RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
    end
    return;
end