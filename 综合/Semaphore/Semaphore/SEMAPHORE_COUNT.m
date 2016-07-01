function num = SEMAPHORE_COUNT()

global Semaphore_Set;

num=0;
        for i=1:255
           if isempty(Semaphore_Set{1,i});
               num=i;
               break;
           end
        end 

end
