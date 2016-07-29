function [ QUEUING_PORT_INDEX ] = FIND_QUEUING_PORT_INDEX( QUEUING_PORT_ID )

    global Queuing_ID_Set;

    ind=find(Queuing_ID_Set==QUEUING_PORT_ID);
    if isempty(ind) == 1
        QUEUING_PORT_INDEX = -1;
        return;
    else
        QUEUING_PORT_INDEX = ind;
        return;     
    end
    
end

