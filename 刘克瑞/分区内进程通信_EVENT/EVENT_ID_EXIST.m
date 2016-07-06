function [flag] = EVENT_ID_EXIST(EVNET_ID)

global Event_Set;
global SYSTEM_NUMBER_OF_EVENTS;

flag=0;
for i=1:SYSTEM_NUMBER_OF_EVENTS
    if EVNET_ID==Event_Set{1,i}.ID
        flag = 1;
        break;
    end
end