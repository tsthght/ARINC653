function [ QUEUING_PORT_STATUS,RETURN_CODE ] = GET_QUEUING_PORT_STATUS( QUEUING_PORT_ID )
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

if INVALID_ID(QUEUING_PORT_ID)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_STATUS=[];
	return;
end

flag=0;
for i=1:512
    if ~isempty(Queuing_Set{1,i})&&Queuing_Set{1,i}.ID==QUEUING_PORT_ID
        flag=1;
        QPort=Queuing_Set{1,i};
        break
    end
end
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_STATUS=[];
	return;
end
        QUEUING_PORT_STATUS.NB_MESSAGE = QPort.NB_MESSAGE;
  		QUEUING_PORT_STATUS.MAX_NB_MESSAGE = QPort.MAX_NB_MESSAGE;
  		QUEUING_PORT_STATUS.MAX_MESSAGE_SIZE = QPort.MAX_MESSAGE_SIZE;
  		QUEUING_PORT_STATUS.PORT_DIRECTION = QPort.PORT_DIRECTION;
  		QUEUING_PORT_STATUS.WAITING_PROCESSES = QPort.WAITING_PROCESSES;
  		RETURN_CODE =  RETURN_CODE_TYPE.NO_ERROR;
  		return;

end

