function flag = SEMAPHORE_INVALID_NAME(NUM)

global Semaphore_NAME_Set;
global System_Limit_Number_Of_Semaphores;

flag=0;
for i=1:System_Limit_Number_Of_Semaphores
    if Semaphore_NAME_Set{1,i}==NUM
        flag = 1;
        break;
    end
end

end
