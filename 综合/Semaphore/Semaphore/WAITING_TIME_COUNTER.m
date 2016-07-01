function [ FLAG ] = WAITING_TIME_COUNTER( PROCESS_ID )

global Time_Out_Set;

flag=0;
for i=1:255
    if Time_Out_Set{1,i}.PROCESS_ID==PROCESS_ID
         flag=Time_Out_Set{1,i}.TIME_OUT_ENABLE;
         break;
    end
end
FLAG=flag;

end

