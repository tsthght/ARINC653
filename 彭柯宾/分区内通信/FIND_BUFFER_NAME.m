function [BUFFER_NAME,ans] = FIND_BUFFER_NAME(STR)
global Waiting_Buffer_Set
ans = -1;
BUFFER_NAME = -1;
for i = 1:8
    for j = 1:255
        if isempty(Waiting_Buffer_Set{i,j}) == 0
            X=Waiting_Buffer_Set{i,j};
        end
        COMPARE=X.NAME;
        if strcmp( STR , COMPARE ) == 1
             ans = STR;
             BUFFER_NAME = Waiting_Buffer_Set{i,j};
             return
        end
    end
end

    
        