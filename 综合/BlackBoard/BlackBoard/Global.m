global MAX_NAME_LENGTH;
MAX_NAME_LENGTH=30;
global RETURN_CODE_TYPE;         
  RETURN_CODE_TYPE=struct('NO_ERROR',0,'NO_ACTION',1,'NOT_AVAILABLE',2,'INVALID_PARAM',3,'INVALID_CONFIG',4,'INVALID_MODE',5,'TIMED_OUT',6);
global SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS;
SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS=256;
global SYSTEM_NUMBER_OF_BLACKBOARDS;
SYSTEM_NUMBER_OF_BLACKBOARDS=0;
global Blackboard_Set;
Blackboard_Set=cell(1,256);
global Current_Partition_STATUS
Current_Partition_STATUS.OPERATING_MODE=OPERATING_MODE_TYPE.IDLE;
Current_Partition_STATUS.LOCK_LEVEL=0;
global Waiting_Blackboard_Set;
Waiting_Blackboard_Set=cell(1,256);
 global Process_Set
Process_Set = cell(1,255);
global Waiting_Timer_Set;
Waiting_Timer_Set=cell(1,255);
 
global Ready_Processes_set
Ready_Processes_set=cell(1,255);
%global Dormant_Processes_set
%Dormant_Processes_set=cell(1,255);
%global Running_Processes_set;
%Running_Processes_set=cell(1,255);
global Waiting_Processes_set
Waiting_Processes_set=cell(1,255); 
global PROCESS_STATE_TYPE
PROCESS_STATE_TYPE.DORMANT = 0;
PROCESS_STATE_TYPE.READY = 1;
PROCESS_STATE_TYPE.RUNNING = 2;
PROCESS_STATE_TYPE.WAITING = 3;
global TIME_OUT_TYPE
TIME_OUT_TYPE.FALSE = 0;
TIME_OUT_TYPE.TRUE = 1 ;
global ERROR_HANDLER_PROCESS_ID;
ERROR_HANDLER_PROCESS_ID=0;
global INFINITE_TIME_VALUE;
INFINITE_TIME_VALUE=-1;
         