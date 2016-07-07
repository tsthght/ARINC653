function flag = SEMAPHORE_INVALID_ID(NUM)

global Semaphore_ID_Set;

flag=0;
if sum(ismember(Semaphore_ID_Set,NUM)) >= 1
    flag = 1;
    return;
end

end