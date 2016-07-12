function [ QUEUING_PORT_ID,RETURN_CODE ] = GET_QUEUING_PORT_ID( QUEUING_PORT_NAME )
global RETURN_CODE_TYPE;
global SYSTEM_NUMBER_OF_QUEUING_PORTS;
global Queuing_Set;
global Configuration_table;
 global Current_Partition_STATUS;
 global MAX_NUMBER_OF_QUEUING_PORTS;
global PARTITION_CONFIG;
global PROCESS_STATE_TYPE
global Current_Process
global Waiting_Queuing_Set 
global Waiting_Timer_Set
global ERROR_HANDLER_PROCESS_ID
global INFINITE_TIME_VALUE
global Time_Out_Signal

if INVALID_NAME(QUEUING_PORT_NAME)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_ID=0;
	return;
end

flag=0;
for i=1:512
    if ~isempty(Queuing_Set{1,i})&&strcmp(Queuing_Set{1,i}.NAME,QUEUING_PORT_NAME)
        flag=1;
        QPort=Queuing_Set{1,i};
        break
    end
end
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    QUEUING_PORT_ID=0;
	return;
end
QUEUING_PORT_ID = QPort.ID;
RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
return


end

