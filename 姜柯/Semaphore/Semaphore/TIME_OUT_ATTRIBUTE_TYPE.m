classdef TIME_OUT_ATTRIBUTE_TYPE  
    properties
        PROCESS_ID;
        TIME_OUT_VALUE;   
        TIME_OUT_SIGNAL;
        TIME_OUT_ENABLE;
    end
    
    methods
        function TIME = TIME_OUT_ATTRIBUTE_TYPE(process_id,tiem_out_value,time_out_signal)
                TIME.PROCESS_ID = process_id; 
                TIME.TIME_OUT_VALUE = tiem_out_value;
                TIME.TIME_OUT_SIGNAL = time_out_signal;
        end           
    end
     
end


