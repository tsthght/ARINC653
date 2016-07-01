function [EVENT_COUNT] = EVENT_COUNT()

global Event_Set;

count=0;
for i=1:256
    if isempty(Event_Set{1,i})==0
        count = count + 1;
        continue;
    end
end
EVENT_COUNT = count;