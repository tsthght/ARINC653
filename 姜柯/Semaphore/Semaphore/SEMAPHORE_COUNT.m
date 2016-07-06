function num = SEMAPHORE_COUNT()

    global Semaphore_Set;
    global System_Limit_Number_Of_Semaphores;

    num=0;
    for i=1:System_Limit_Number_Of_Semaphores
        if isempty(Semaphore_Set{1,i});
            num=i;
            break;
        end
    end 

end
