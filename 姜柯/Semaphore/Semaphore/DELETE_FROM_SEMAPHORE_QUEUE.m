function DELETE_FROM_SEMAPHORE_QUEUE( SEMAPHORE_ID )

global Semaphore_Set;

    for i=1:255
            if Semaphore_Set{1,i}.ID==SEMAPHORE_ID
                Semaphore_Set{1,SEMAPHORE_ID}.WAITING_PROCESSES=Semaphore_Set{1,SEMAPHORE_ID}.WAITING_PROCESSES-1;
                break;
            end
    end 
    disp('PROCESS DELETE FROM SEMAPHORE QUEUE SUCCESS');


end

