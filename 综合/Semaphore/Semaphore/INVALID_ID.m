function flag = INVALID_ID(NUM)

global Semaphore_ID_Set;

flag=0;
for i=1:255
    if Semaphore_ID_Set{1,i} == NUM;
        flag = 1;
        break;
    end
end

end