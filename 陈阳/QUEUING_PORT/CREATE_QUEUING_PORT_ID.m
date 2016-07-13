function [QUEUING_PORT_ID] = CREATE_QUEUING_PORT_ID()

    global MAX_NUMBER_OF_QUEUING_PORTS;
    global Queuing_ID_Set;

    id=-1;
    flag=1;
    while(flag == 1)
        id = round( 1+(MAX_NUMBER_OF_QUEUING_PORTS-1) *rand(1,1) );
        flag=0;
        if sum(ismember(Queuing_ID_Set,id)) >= 1
            flag = 1;
        end
    end        
    QUEUING_PORT_ID=id;
    return;
    
end