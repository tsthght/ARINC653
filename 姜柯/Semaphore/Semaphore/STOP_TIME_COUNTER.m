function STOP_TIME_COUNTER( PROCESS_ID )

global Time_Out_Set;

if numel(Time_Out_Set) ~= 0
    for i=1:numel(Time_Out_Set)
        if Time_Out_Set{1,i}.PROCESS_ID==PROCESS_ID
             Time_Out_Set{1,i}.TIME_OUT_ENABLE=0;
             break;
        end
    end
end
    
end

