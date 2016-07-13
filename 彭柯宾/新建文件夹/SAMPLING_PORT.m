classdef SAMPLING_PORT
    properties
         ID
         NAME
         REFRESH_PERIOD
         MAX_MESSAGE_SIZE
         PORT_DIRECTION
         LAST_MSG_VALIDITY
    end
    
    methods
        function SPort = SAMPLING_PORT(id,Last_Msg_Validity)
                SPort.ID = id;
                
                SPort.LAST_MSG_VALIDITY = Last_Msg_Validity;
        end
   
%          function  disp(PRO)
% %                money = pay.principle * (1 + pay.rate)^pay.term;
%                fprintf(' %d \n', PRO.ID);
%         end
     end
end
