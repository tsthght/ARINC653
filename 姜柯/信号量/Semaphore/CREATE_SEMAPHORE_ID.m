function [SEMAPHORE_ID] = CREATE_SEMAPHORE_ID()

    global System_Limit_Number_Of_Semaphores;
    global Semaphore_ID_Set;

    id=-1;
    flag=1;
    while(flag == 1)
        id = round( 1+(System_Limit_Number_Of_Semaphores-1) *rand(1,1) );
        flag=0;
        if sum(ismember(Semaphore_ID_Set,id)) >= 1
            flag = 1;
        end
    end        
    SEMAPHORE_ID=id;
    return;
    
end