classdef PROCESS_ATTRIBUTE_TYPE  
    properties
        ID;
        DEADLINE_TIME;
        CURRENT_PRIORITY;   
        PROCESS_STATE;
        PERIOD;
        TIME_CAPACITY;
        ENTRY_POINT;
        STACK_SIZE;
        BASE_PRIORITY;
        DEADLINE;
        NAME;
    end
    
    methods
        function PRO = PROCESS_ATTRIBUTE_TYPE(id,deadline_tine,current_priority,process_state,period,time_capacity,entry_point,stack_size,base_priority,deadline,name)
                PRO.ID = id;              
                PRO.DEADLINE_TIME = deadline_tine;
                PRO.CURRENT_PRIORITY = current_priority;
                PRO.PROCESS_STATE = process_state;
                PRO.PERIOD = period;
                PRO.TIME_CAPACITY = time_capacity;
                PRO.ENTRY_POINT = entry_point;
                PRO.STACK_SIZE = stack_size;
                PRO.BASE_PRIORITY = base_priority;
                PRO.DEADLINE = deadline;
                PRO.NAME = name;
        end           
    end
     
end
