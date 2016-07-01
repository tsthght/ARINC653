function [RETURN_CODE] = RESET_EVENT(EVENT_ID)

global RETURN_CODE_TYPE;
global Event_Set;
global EVENT_STATE_TYPE;

flag = EVENT_ID_EXIST(EVENT_ID);
if flag == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM
    return;
end
    
for i = 1:256
    if  Event_Set{1,i}.ID == EVENT_ID
        if Event_Set{1,i}.STATE == EVENT_STATE_TYPE.DOWN
            disp('THIS EVENT HAS ALREADY BEEN RESET!!');
            return;
        else 
            Event_Set{1,i}.STATE=EVENT_STATE_TYPE.DOWN;
            break;
        end
    end
end

    