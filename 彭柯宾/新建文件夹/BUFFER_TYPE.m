classdef BUFFER_TYPE

    properties
    NAME;    
    ID;
    NB_MESSAGE;
    MAX_NB_MESSAGE;
    MAX_MESSAGE_SIZE;
    WAITING_PROCESSES;
    QUEUING_DISCIPLINE;
   
    end
    methods
        function BUF = BUFFER_TYPE(NAME,ID,NB_MESSAGE,MAX_NB_MESSAGE,MAX_MESSAGE_SIZE,WAITING_PROCESSES,QUEUING_DISCIPLINE)
        BUF.NAME = NAME;
        BUF.ID = ID;
        BUF.NB_MESSAGE = NB_MESSAGE;
        BUF.MAX_NB_MESSAGE = MAX_NB_MESSAGE;
        BUF.MAX_MESSAGE_SIZE = MAX_MESSAGE_SIZE;
        BUF.WAITING_PROCESSES = WAITING_PROCESSES;
        BUF.QUEUING_DISCIPLINE = QUEUING_DISCIPLINE;
        
        end
%         function CREAT_BUFFER_ZONE(a)
%         x = a;
%         BUFFER_ZONE = cell(1,255);
%         end
    end
end



