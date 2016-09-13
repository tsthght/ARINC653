function [ID] = CREATE_QUEUING_PORT_ID()
global Queuing_Set;
    flag=0;
     
     while flag==0
         ID = round( 1+(65535) *rand(1,1) );
         flag=1;
         for i=1:numel(Queuing_Set)
             if ~isempty(Queuing_Set{1,i}) && Queuing_Set{1,i}.ID==ID
              flag=0;
            
              break
             end
         end
     end
end