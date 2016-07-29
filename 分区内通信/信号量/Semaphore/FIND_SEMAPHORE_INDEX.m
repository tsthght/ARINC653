function [ SEMAPHORE_INDEX ] = FIND_SEMAPHORE_INDEX( SEMAPHORE_ID )

    global Semaphore_ID_Set;

    ind=find(Semaphore_ID_Set==SEMAPHORE_ID);
    if isempty(ind) == 1
        SEMAPHORE_INDEX = -1;
        return;
    else
        SEMAPHORE_INDEX = ind;
        return;     
    end
    
end

