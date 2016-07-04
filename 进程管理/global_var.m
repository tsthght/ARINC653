global RETURN_CODE_TYPE

RETURN_CODE_TYPE.NO_ERROR = 0;   
RETURN_CODE_TYPE.NO_ACTION = 1;  
RETURN_CODE_TYPE.NOT_AVAILABLE = 2;   
RETURN_CODE_TYPE.INVALID_PARAM = 3;  
RETURN_CODE_TYPE.INVALID_CONFIG = 4;  
RETURN_CODE_TYPE.INVALID_MODE = 5;  
RETURN_CODE_TYPE.TIMED_OUT = 6;       

global PROCESS_STATE_TYPE
PROCESS_STATE_TYPE.DORMANT = 0;
PROCESS_STATE_TYPE.READY = 1;
PROCESS_STATE_TYPE.RUNNING = 2;
PROCESS_STATE_TYPE.WAITING = 3;
              

global ATTRIBUTES %这些数值是自己定义的，可以随意修改
ATTRIBUTES.PERIOD=0;
ATTRIBUTES.TIME_CAPACITY=0;
ATTRIBUTES.ENTRY_POINT=0;
ATTRIBUTES.STACK_SIZE=0;
ATTRIBUTES.BASE_PRIORITY=0;
ATTRIBUTES.DEADLINE_TYPE.DEADLINE=0;
ATTRIBUTES.NAME=0;





global OPERATING_MODE_TYPE
OPERATING_MODE_TYPE.IDLE = 0;
OPERATING_MODE_TYPE.COLD_START = 1;
OPERATING_MODE_TYPE.WARM_START = 2;
OPERATING_MODE_TYPE.NORMAL = 3;

global ID;
global DEADLINE_TYPE
DEADLINE_TYPE.SOFT = 0;
DEADLINE_TYPE.HARD = 1;

global Current_Partition_STATUS
Current_Partition_STATUS.OPERATING_MODE=OPERATING_MODE_TYPE.COLD_START ;
Current_Partition_STATUS.LOCK_LEVEL=0;

global Process_Set
Process_Set = cell(0);
 
global Process_Waiting_Resource_Set
Process_Waiting_Resource_Set= [];
global Ready_Processes_set
Ready_Processes_set=[];
global Dormant_Processes_set
Dormant_Processes_set=[];
global Running_Processes_set;
Running_Processes_set=[];
global Waiting_Processes_set
Waiting_Processes_set=[];



global Current_Partition_Timer;
Current_Partition_Timer=cell(1,255);

global ERROR_HANDLER_PROCESS_ID;
ERROR_HANDLER_PROCESS_ID=nan;
global INFINITE_TIME_VALUE;
INFINITE_TIME_VALUE=-1;

global Current_Process
Current_Process.ID=6;
Current_Process.DEADLINE_TIME=10;
Current_Process.CURRENT_PRIORITY =3;
Current_Process.PROCESS_STATE =0;
Current_Process.PERIOD =0;
Current_Process.TIME_CAPACITY =5;
Current_Process.ENTRY_POINT =20;
Current_Process.STACK_SIZE =200;
Current_Process.BASE_PRIORITY =0;
Current_Process.DEADLINE=30;
Current_Process.NAME =4;

global Previous_Process
Previous_Process.ID=5;
Previous_Process.DEADLINE_TIME=10;
Previous_Process.CURRENT_PRIORITY=3;
Previous_Process.PROCESS_STATE=1;
Previous_Process.PERIOD=-1;
Previous_Process.TIME_CAPACITY=5;
Previous_Process.ENTRY_POINT=20;
Previous_Process.STACK_SIZE=200;
Previous_Process.BASE_PRIORITY=0;
Previous_Process.DEADLINE=30;
Previous_Process.NAME=3;


global Idel_Process
Idel_Process.ID=-1;
Idel_Process.PERIOD=1;
Idel_Process.TIME_CAPACITY=2;
Idel_Process.ENTRY_POINT=1;
Idel_Process.STACK_SIZE=2;
Idel_Process.BASE_PRIORITY=1;
Idel_Process.DEADLINE_TYPE.DEADLINE=1;
Idel_Process.NAME='idel';
Idel_Process.LOCK_LEVEL = 0;
Idel_Process.OPERATING_MODE = 0;

global LOCK_LEVEL
LOCK_LEVEL = 0;
global MAX_LOCK_LEVEL
MAX_LOCK_LEVEL = 0;

global PROCESS_STATUS
 PROCESS_STATUS.DEADLINE_TIME=0;
 PROCESS_STATUS.CURRENT_PRIORITY=0 ;
 PROCESS_STATUS.PROCESS_STATUS=0;
 PROCESS_STATUS.ATTRIBUTES.NAME=0;
 PROCESS_STATUS.ATTRIBUTES.ENTRY_POINT=0 ;
 PROCESS_STATUS.ATTRIBUTES.STACK_SIZE=0  ;
 PROCESS_STATUS.ATTRIBUTES.BASE_PRIORITY=0 ;
 PROCESS_STATUS.ATTRIBUTES.PERIOD=0 ;
 PROCESS_STATUS.ATTRIBUTES.TIME_CAPACITY=0 ;
 PROCESS_STATUS.ATTRIBUTES.DEADLINE=0;
 
global MAX_NUMBER_OF_PROCESS
MAX_NUMBER_OF_PROCESS = 255;
global MIN_PRIORITY_VALUE
MIN_PRIORITY_VALUE = 1;
global MAX_PRIORITY_VALUE 
MAX_PRIORITY_VALUE = 63;
global SYSTEM_TIME_TYPE
SYSTEM_TIME_TYPE = 2^64;
global SYSTEM_MAX_TIMEOUT;
SYSTEM_MAX_TIMEOUT = 32;

global Time_Out_Signal;
Time_Out_Signal.TRUE = 1;
Time_Out_Signal.FALSE = 0;

global PROCESS_NAME_SET
 PROCESS_NAME_SET = cell(0);
 global PROCESS_ID_SET
 PROCESS_ID_SET = [];
 
