function flag = INVALID_NAME(NUM)

global Process_NAME_Set;

flag=0;
if sum(ismember(Process_NAME_Set,NUM)) >= 1
    flag = 1;
    return;
end

end
