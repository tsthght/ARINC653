
global Current_Partition_STATUS;
Current_Partition_STATUS = PARTITION_STATUS_TYPE(1,0.1,0.02,0,1,0);

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

global ERROR_HANDLER_PROCESS_ID;
ERROR_HANDLER_PROCESS_ID = NULL_PROCESS_ID;

global maximum_number_of_error_hander
maximum_number_of_error_hander = 10;

global HealthMonitor_Set
HealthMonitor_Set=[];

global Error_Process
Error_Process=[];

global Semaphore_Set
Semaphore_Set = [];

global Semaphore_NAME_Set
Semaphore_NAME_Set = [];

global Semaphore_ID_Set
Semaphore_ID_Set = [];

global Time_Out_Set
Time_Out_Set = [];

global TIMER_TYPE
TIMER_TYPE.TRUE=0;

global BUFFER_STATUS
BUFFER_STATUS.NB_MESSAGE=0;        
BUFFER_STATUS.MAX_NB_MESSAGE=0;   
BUFFER_STATUS.MAX_MESSAGE_SIZE=0;    
BUFFER_STATUS.WAITING_PROCESSES=0;
  
global DATA_ZONE
DATA_ZONE = cell(0);
 
global BUFFER
BUFFER = cell(MAX_NUMBER_OF_PROCESS);

global Blackboard_Set;
Blackboard_Set=cell(0);

global Waiting_Blackboard_Set;
Waiting_Blackboard_Set=cell(0);

global SYSTEM_NUMBER_OF_SAMPLING_PORTS
SYSTEM_NUMBER_OF_SAMPLING_PORTS = 0;

global Sampling_Set
Sampling_Set = cell(1,255);

global Sampling_obj
Sampling_obj ={};

global SPORT
SPORT.PORT_DIRECTION=1;
SPORT.EMPTY_INDICATOR=1;
SPORT.LENGTH =5;

global SAMPING_PORT
SAMPING_PORT = cell(MAX_NUMBER_OF_PROCESS);

global Waiting_Buffer_Set 
Waiting_Buffer_Set = cell(8,255);

global Configuration_table
Configuration_table=cell(1,512);
Configuration_table{1,1}.NAME='cy';
Configuration_table{1,1}.CURRENT_PARTITION_NAME='par1';
Configuration_table{1,1}.MAX_MESSAGE_SIZE=100;
Configuration_table{1,1}.MAX_NB_MESSAGE=100;
Configuration_table{1,1}.PORT_DIRECTION=0;

global SYSTEM_NUMBER_OF_QUEUING_PORTS
SYSTEM_NUMBER_OF_QUEUING_PORTS=0;

global Queuing_Set
Queuing_Set=[];

global Queuing_ID_Set
Queuing_ID_Set=[];

global PARTITION_CONFIG
PARTITION_CONFIG.NAME='par1';
PARTITION_CONFIG.ID=1;

global MAX_PREOCESS_DELAY_TIME 
MAX_PREOCESS_DELAY_TIME = 255;

global MAX_BUDGET_TIME
MAX_BUDGET_TIME = 255;
ATTRIBUTES.PERIOD=[];
ATTRIBUTES.TIME_CAPACITY=[];
ATTRIBUTES.ENTRY_POINT=[];
ATTRIBUTES.STACK_SIZE=[];
ATTRIBUTES.BASE_PRIORITY=[];
ATTRIBUTES.DEADLINE=[];
ATTRIBUTES.NAME=[];