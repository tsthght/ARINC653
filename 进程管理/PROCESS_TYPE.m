classdef PROCESS_TYPE
    properties
        ID;
        NAME;
        PARID;
        DEADLINE_TIME;
        CURRENT_PRIORITY;
        PROCESS_STATE;
        PERIOD;
        TIME_CAPACITY;
        ENTRY_POINT;
        STACK_SIZE;
        BASE_PRIORITY;
        DEADLINE;
    end
    
    methods
        function PRO = PROCESS_TYPE(id,name,parid, deadline_time,current_priority,process_state,period,time_capacity,entry_point,stack_size,base_priority,deadline)
                PRO.ID = id;
                PRO.NAME = name;
                PRO.PARID = parid;
                PRO.DEADLINE_TIME = deadline_time;
                PRO.CURRENT_PRIORITY = current_priority;
                PRO.PROCESS_STATE = process_state;
                PRO.PERIOD = period;
                PRO.TIME_CAPACITY = time_capacity;
                PRO.ENTRY_POINT = entry_point;
                PRO.STACK_SIZE = stack_size;
                PRO.BASE_PRIORITY = base_priority;
                PRO.DEADLINE = deadline;
        end
   
         function  disp(PRO)
%                money = pay.principle * (1 + pay.rate)^pay.term;
               fprintf(' %d \n', PRO.ID);
        end
     end
end
