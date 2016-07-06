function flag = SEMAPHORE_INVALID_ID(NUM)

global Semaphore_ID_Set;
global System_Limit_Number_Of_Semaphores;

flag=0;
for i=1:System_Limit_Number_Of_Semaphores
    if Semaphore_ID_Set{1,i} == NUM;
        flag = 1;
        break;
    end
end

end