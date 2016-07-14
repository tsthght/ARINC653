classdef EVENT_TYPE
    properties
        ID;
        NAME;
        STATE;
        WAITING_PROCESSES;
    end
    
    methods
        function EVENT = EVENT_TYPE(id,name,state,waiting_processes)
                EVENT.ID = id;
                EVENT.NAME = name;
                EVENT.STATE = state;
                EVENT.WAITING_PROCESSES = waiting_processes;
        end
    end
end