global MAX_NAME_LENGTH;
MAX_NAME_LENGTH=30;
global RETURN_CODE_TYPE;         
  RETURN_CODE_TYPE=struct('NO_ERROR',0,'NO_ACTION',1,'NOT_AVAILABLE',2,'INVALID_PARAM',3,'INVALID_CONFIG',4,'INVALID_MODE',5,'TIMED_OUT',6);
global Configuration_table;
Configuration_table=cell(1,512);
Configuration_table{1,1}.NAME='cy';
Configuration_table{1,1}.CURRENT_PARTITION_NAME='hi';
Configuration_table{1,1}.MAX_MESSAGE_SIZE=100;
Configuration_table{1,1}.MAX_NB_MESSAGE=100;
Configuration_table{1,1}.PORT_DIRECTION=PORT_DIRECTION_TYPE.SOURCE;

global  SYSTEM_LIMIT_NUMBER_OF_QUEUING_PORTS;
 SYSTEM_LIMIT_NUMBER_OF_QUEUING_PORTS=512;
 global MAX_NUMBER_OF_QUEUING_PORTS;
 MAX_NUMBER_OF_QUEUING_PORTS=512;
global SYSTEM_NUMBER_OF_QUEUING_PORTS
 SYSTEM_NUMBER_OF_QUEUING_PORTS=0;
 global Current_Partition_STATUS
Current_Partition_STATUS.OPERATING_MODE=OPERATING_MODE_TYPE.IDLE;
Current_Partition_STATUS.LOCK_LEVEL=0;
global Queuing_Set;
Queuing_Set=cell(1,512);
global Waiting_Queuing_Set 
 Waiting_Queuing_Set =cell(1,512);
 global Waiting_Timer_Set
Waiting_Timer_Set=cell(1,255);


global PARTITION_CONFIG;
PARTITION_CONFIG.NAME='hi';
PARTITION_CONFIG.ID=1;


global Waiting_Processes_set
Waiting_Processes_set=cell(1,255); 
global Running_Processes_set;
Running_Processes_set=cell(1,255);
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
global Time_Out_Signal
Time_Out_Signal=0;

global Current_Process
Current_Process.ID=6;
Current_Process.DEADLINE_TIME=10;
Current_Process.CURRENT_PRIORITY =3;
Current_Process.PROCESS_STATE =0;
Current_Process.PERIOD =0;
Current_Process.TIME_CAPACITY =5;
Current_Process.ENTRY_POIN =20;
Current_Process.STACK_SIZE =200;
Current_Process.BASE_PRIORITY =0;
Current_Process.DEADLINE=30;
Current_Process.NAME =4;
