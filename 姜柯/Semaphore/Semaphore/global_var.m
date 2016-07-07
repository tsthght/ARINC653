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

global System_Limit_Number_Of_Semaphores
System_Limit_Number_Of_Semaphores = 512;
global MAX_SEMAPHORE_VALUE
MAX_SEMAPHORE_VALUE = 32767;
global FIFO
FIFO = 1;
global PRIORITY_ORDER
PRIORITY_ORDER = 0;
global INFINITE_TIME_VALUE
INFINITE_TIME_VALUE = -1;

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

global PROCESS_SCHEDULING_FLAG
PROCESS_SCHEDULING_FLAG = 0;

global Ready_Processes_set
Ready_Processes_set=[];
global Dormant_Processes_set
Dormant_Processes_set=[];
global Running_Processes_set
Running_Processes_set=[];
global Waiting_Processes_set
Waiting_Processes_set=[];
