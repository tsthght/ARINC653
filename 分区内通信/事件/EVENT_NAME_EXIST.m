function [flag] = EVENT_NAME_EXIST(EVNET_NAME)

global Event_Set;
global SYSTEM_NUMBER_OF_EVENTS;

flag=0;
for i=1:SYSTEM_NUMBER_OF_EVENTS
    if strcmp(EVNET_NAME,Event_Set{1,i}.NAME)==1
        flag = 1;
        break;
    end
end