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
              
global OPERATING_MODE_TYPE
OPERATING_MODE_TYPE.IDLE = 0;
OPERATING_MODE_TYPE.COLD_START = 1;
OPERATING_MODE_TYPE.WARM_START = 2;
OPERATING_MODE_TYPE.NORMAL = 3;

global Process_Set
Process_Set = [];
global Process_ID_Set
Process_ID_Set = [];
global Process_NAME_Set
Process_NAME_Set = [];

global Ready_Processes_set
Ready_Processes_set=[];
global Dormant_Processes_set
Dormant_Processes_set=[];
global Running_Processes_set
Running_Processes_set=[];
global Waiting_Processes_set
Waiting_Processes_set=[];

global ERROR_CODE_TYPE
ERROR_CODE_TYPE.DEADLINE_MISSED=0;
ERROR_CODE_TYPE.APPLICATION_ERROR=1;
ERROR_CODE_TYPE.NUMERIC_ERROR=2;
ERROR_CODE_TYPE.ILLEGAL_REQUEST=3;
ERROR_CODE_TYPE.STACK_OVERFLOW=4;
ERROR_CODE_TYPE.MEMORY_VIOLATION=5;
ERROR_CODE_TYPE.HARDWARE_FAULT=6;
ERROR_CODE_TYPE.POWER_FAIL=7;

global highest_priority
highest_priority = 31;
global maximum_number_of_error_hander
maximum_number_of_error_hander = 10;
global MAX_ERROR_MESSAGE_SIZE
MAX_ERROR_MESSAGE_SIZE = 128;

global Current_Partition_STATUS
Current_Partition_STATUS.PERIOD=0;
Current_Partition_STATUS.DURATION=0;
Current_Partition_STATUS.IDENTIFIER=1;
Current_Partition_STATUS.LOCK_LEVEL=0;
Current_Partition_STATUS.OPERATING_MODE=0;
Current_Partition_STATUS.START_CONDITION=3;

global Current_Process
Current_Process.ID=0;
Current_Process.DEADLINE_TIME=10;
Current_Process.CURRENT_PRIORITY =31;
Current_Process.PROCESS_STATE =0;
Current_Process.PERIOD =0;
Current_Process.TIME_CAPACITY =5;
Current_Process.ENTRY_POINT =20;
Current_Process.STACK_SIZE =200;
Current_Process.BASE_PRIORITY =0;
Current_Process.DEADLINE=30;
Current_Process.NAME =4;

global PROCESS_SCHEDULING_FLAG
PROCESS_SCHEDULING_FLAG = 0;

