classdef SEMAPHORE_ATTRIBUTE_TYPE  
    properties
        NAME;
        ID;
        VALUE;   
        CURRENT_VALUE;
        MAXIMUM_VALUE;
        WAITING_PROCESSES;
        SEMAPHORE_QUEUE;
        P;
    end
    
    methods
        function SEMA = SEMAPHORE_ATTRIBUTE_TYPE(name,id,value,current_value,maximum_value,waiting_processes)
                SEMA.NAME = name; 
                SEMA.ID = id;
                SEMA.VALUE = value;
                SEMA.CURRENT_VALUE = current_value;
                SEMA.MAXIMUM_VALUE = maximum_value;
                SEMA.WAITING_PROCESSES = waiting_processes;
        end           
    end
     
end
