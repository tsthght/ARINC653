function [ QUEUING_PORT_INDEX ] = FIND_QUEUING_PORT_INDEX( QUEUING_PORT_ID )
global Queuing_Set
    QUEUING_PORT_INDEX=-1;
    for i=1:numel(Queuing_Set)
        if Queuing_Set{1,i}.ID==QUEUING_PORT_ID
            QUEUING_PORT_INDEX=i;
            break
        end
    end
   
       
    
end

