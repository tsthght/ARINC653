function [BUFFER_ID] = FIND_BUFFER_ID(STR)
global Buffer_set
BUFFER_ID = -1;
for i = 1:sum( cellfun('length',Buffer_set))
    if strcmp(Buffer_set{1,i}.NAME,STR) == 1
        BUFFER_ID = Buffer_set{1,i}.ID; 
        return;
    end
end

 
        