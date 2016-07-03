classdef SAMPLING_PORT_CLASS
    properties
       ID;
       SAMPLING_PORT_NAME;
 	   REFRESH_PERIOD;
 	   MAX_MESSAGE_SIZE;
 	   PORT_DIRECTION;
       LAST_MSG_VALIDITY;
    end
    
    methods
        function SPort = SAMPLING_PORT_CLASS(id,name,refresh_perid, max_message_size,port_direction,last_msg_validity)
                SPort.ID = id;
                SPort.SAMPLING_PORT_NAME = name;
                SPort.REFRESH_PERIOD = refresh_perid;
                SPort.MAX_MESSAGE_SIZE = max_message_size;
                SPort.PORT_DIRECTION = port_direction;
                SPort.LAST_MSG_VALIDITY = last_msg_validity;
        end
   
         function  disp(SPort)
%                money = pay.principle * (1 + pay.rate)^pay.term;
               fprintf(' %d \n', SPort.ID);
        end
     end
end
