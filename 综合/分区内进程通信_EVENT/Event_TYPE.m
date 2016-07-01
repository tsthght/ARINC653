classdef Event_TYPE
    properties
        ID;
        NAME;
        STATE;
        WAITING_PROCESSES;
    end
    
    methods
        function Event = Event_TYPE(id,name,state,waiting_processes)
                Event.ID = id;
                Event.NAME = name;
                Event.STATE = state;
                Event.WAITING_PROCESSES = waiting_processes;
        end
    end
end