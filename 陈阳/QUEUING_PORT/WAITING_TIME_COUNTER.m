function [ FLAG ] = WAITING_TIME_COUNTER( PROCESS_ID )

global Time_Out_Set;

flag=0;
if numel(Time_Out_Set) ~=0
    for i=1:numel(Time_Out_Set)
        if Time_Out_Set{1,i}.PROCESS_ID==PROCESS_ID
             flag=Time_Out_Set{1,i}.TIME_OUT_ENABLE;
             break;
        end
    end
end
FLAG=flag;

end

