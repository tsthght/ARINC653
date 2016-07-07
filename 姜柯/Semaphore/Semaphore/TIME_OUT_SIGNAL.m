function [ SIGNAL ] = TIME_OUT_SIGNAL( PRO_ID )

global Time_Out_Set;

flag=false;

if numel(Time_Out_Set) ~=0
    for i=1:numel(Time_Out_Set)
        if Time_Out_Set{1,i}.PROCESS_ID == PRO_ID;
            flag = Time_Out_Set{1,i}.TIME_OUT_SIGNAL;
            break;
        end
    end
end

SIGNAL=flag;

end

