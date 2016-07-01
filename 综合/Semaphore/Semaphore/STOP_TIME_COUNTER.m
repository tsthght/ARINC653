function STOP_TIME_COUNTER( PROCESS_ID )

global Time_Out_Set;

for i=1:255
    if Time_Out_Set{1,i}.PROCESS_ID==PROCESS_ID
         Time_Out_Set{1,i}.TIME_OUT_ENABLE=0;
         break;
    end
end

end

