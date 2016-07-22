function flag = SEMAPHORE_INVALID_NAME(NUM)

global Semaphore_NAME_Set;

flag=0;
if sum(ismember(Semaphore_NAME_Set,NUM)) >= 1
    flag = 1;
    return;
end

end
