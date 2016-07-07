function INSERT_INTO_SEMAPHORE_QUEUE(SEMAPHORE_ID,PROCESS_ID)

global Semaphore_Set;

    for i=1:numel(Semaphore_Set{1,SEMAPHORE_ID}.SEMAPHORE_QUEUE)
            if isempty(Semaphore_Set{1,SEMAPHORE_ID}.SEMAPHORE_QUEUE{1,i})
                Semaphore_Set{1,SEMAPHORE_ID}.SEMAPHORE_QUEUE{1,i} = PROCESS_ID;
                Semaphore_Set{1,SEMAPHORE_ID}.WAITING_PROCESSES=Semaphore_Set{1,SEMAPHORE_ID}.WAITING_PROCESSES+1;
                break;
            end
    end 

end

