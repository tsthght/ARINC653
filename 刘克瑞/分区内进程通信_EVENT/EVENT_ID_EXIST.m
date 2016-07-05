function [flag] = EVENT_ID_EXIST(EVNET_ID)

global Event_Set;
global MAX_NUMBER_OF_EVENTS
flag=0;
for i=1:MAX_NUMBER_OF_EVENTS
    if isempty(Event_Set{1,i})==1
        flag = 0;
        continue;
    end
    if EVNET_ID==Event_Set{1,i}.ID
        flag = 1;
        break;
    end
end