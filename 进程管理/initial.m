ATTRIBUTES.PERIOD=0;
ATTRIBUTES.TIME_CAPACITY=8;
ATTRIBUTES.ENTRY_POINT=16;
ATTRIBUTES.STACK_SIZE=20;
ATTRIBUTES.BASE_PRIORITY=24;
ATTRIBUTES.DEADLINE=28;
ATTRIBUTES.NAME='eee';

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

global PROCESS_ID_SET
PROCESS_ID_SET = [];
 
global Event_Set;
Event_Set = cell(0);

global Current_Partition_Timer;
Current_Partition_Timer=cell(1,255);

global Current_Process;
Current_Process = [];

global Previous_Process
Previous_Process = [];

global PARA_REG1;
PARA_REG1 = cell(255,255);

global PARA_REG2;
PARA_REG2 = cell(255,255);

global LOCK_LEVEL
LOCK_LEVEL = 0;
 
global SYSTEM_NUMBER_OF_PROCESSES;
SYSTEM_NUMBER_OF_PROCESSES = numel(Process_Set);

global SYSTEM_TIME_TYPE
SYSTEM_TIME_TYPE = 2^64;

global SYSTEM_MAX_TIMEOUT;
SYSTEM_MAX_TIMEOUT = 32;

global Time_Out_Signal;
Time_Out_Signal.TRUE = 1;
Time_Out_Signal.FALSE = 0;

global PROCESS_NAME_SET
 PROCESS_NAME_SET = cell(0);
 
global SYSTEM_NUMBER_OF_EVENTS;
SYSTEM_NUMBER_OF_EVENTS = numel(Event_Set);

global MAX_EVENT_WAITING_PROCESSES;
MAX_EVENT_WAITING_PROCESSES = 4;

global PROCESS_SCHEDULING_FLAG;
PROCESS_SCHEDULING_FLAG = 0;

global PCCounter;
PCCounter = 0;