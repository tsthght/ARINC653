function [flag] = EVENT_NAME_EXIST(EVNET_NAME)

global Event_Set;
flag=0;
for i=1:256
    if isempty(Event_Set{1,i})==1
        flag = 0;
        continue;
    end
    if strcmp(EVNET_NAME,Event_Set{1,i}.NAME)==1
        flag = 1;
        break;
    end
end