function INSERT_INTO_REVEIVE_QUEUE( QUEUING_PORT_ID,PROCESS_ID )

global 	Queuing_Set;

LOCATION = FIND_QUEUING_PORT_INDEX( QUEUING_PORT_ID );

QUEUE_ID = numel(Queuing_Set{1,LOCATION}.RECEIVE_QUEUE) + 1;
Queuing_Set{1,LOCATION}.RECEIVE_QUEUE(QUEUE_ID) = PROCESS_ID;

end

