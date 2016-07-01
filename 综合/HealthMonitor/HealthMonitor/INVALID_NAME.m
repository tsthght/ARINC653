function flag = INVALID_NAME(NUM)

global Process_NAME_Set;

flag=0;
for i=1:255
    if Process_NAME_Set{1,i}==NUM
        flag = 1;
        break;
    end
end

end
