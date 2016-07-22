function CREATE_TIME_OUT_COUNTER(PRO_ID,TIME_OUT)

global Time_Out_Set;

num=numel(Time_Out_Set)+1;

if num==1
    TIME = TIME_OUT_ATTRIBUTE_TYPE(0,0,0);
    TIME.PROCESS_ID=PRO_ID;
    TIME.TIME_OUT_VALUE=TIME_OUT+1000;
    if TIME.TIME_OUT_VALUE<-9223372036854775809 || TIME.TIME_OUT_VALUE>9223372036854775808
        TIME.TIME_OUT_SIGNAL=false;
    else 
        TIME.TIME_OUT_SIGNAL=true;
    end
    TIME.TIME_OUT_ENABLE=1;
    Time_Out_Set{1,num} = TIME;
else
    flag=0;
    id=1;
    for i=1:num-1
        if Time_Out_Set{1,i}.PROCESS_ID == PRO_ID;
            flag = 1;
            id=i;
            break;
        end
    end
    if flag==1
        Time_Out_Set{1,id}.TIME_OUT_VALUE=TIME_OUT+1000;
        if Time_Out_Set{1,id}.TIME_OUT_VALUE<-9223372036854775809 || Time_Out_Set{1,id}.TIME_OUT_VALUE>9223372036854775808
            Time_Out_Set{1,id}.TIME_OUT_SIGNAL=false;
        else
            Time_Out_Set{1,id}.TIME_OUT_SIGNAL=true;
        end
    else
        TIME = TIME_OUT_ATTRIBUTE_TYPE(0,0,0);
        TIME.PROCESS_ID=PRO_ID;
        TIME.TIME_OUT_VALUE=TIME_OUT+1000;
        if TIME.TIME_OUT_VALUE<-9223372036854775809 || TIME.TIME_OUT_VALUE>9223372036854775808
            TIME.TIME_OUT_SIGNAL=false;
        else 
            TIME.TIME_OUT_SIGNAL=true;
        end
        TIME.TIME_OUT_ENABLE=1;
        Time_Out_Set{1,num} = TIME;
    end  
end

end

