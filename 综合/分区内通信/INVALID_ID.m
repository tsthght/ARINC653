function [flag] = INVALID_ID(NUM)

global Process_Set
flag=0;
L = 0;
for i= 1:length(Process_Set)
    if ~isempty(Process_Set{1,i})
        L=L+1;
    end
end

if L == 0
   flag = 0;
   return;
else
    for i=1:L
        x=Process_Set{1,i};
        if x.ID == NUM
            flag = 1;
            return;
        end
    end
end

%disp(flag);