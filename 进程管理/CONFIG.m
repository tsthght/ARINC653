%% PARTITION_MANAGEMENT_SERVICE

%GET_PARTITION_STATUS
SYSTEM_CALL(1);

%SET_PARTITION_MODE
PARA_REG1{1,1} = input('');
SYSTEM_CALL(2);

%% PROCESS_MANAGEMENT_SERVICE

%GET_PROCESS_ID
PARA_REG2{1,1} = input('');
SYSTEM_CALL(3);

%GET_PROCESS_STATUS
PARA_REG1{1,1} = input('');
SYSTEM_CALL(4);

%CREATE_PROCESS
n = 0;
PARA_REG2{1,1} = ATTRIBUTES;
SYSTEM_CALL(5);
while(n<5)
    ATTRIBUTES.NAME = input('');
    ATTRIBUTES.PERIOD = input('');
    ATTRIBUTES.TIME_CAPACITY=round(63*rand(1,1));
    ATTRIBUTES.ENTRY_POINT=round(2^32*rand(1,1));
    ATTRIBUTES.STACK_SIZE=round(10*rand(1,1));
    ATTRIBUTES.BASE_PRIORITY=round(239*rand(1,1));
    ATTRIBUTES.DEADLINE=round(rand(1,1));
    PARA_REG2{1,1} = ATTRIBUTES;
    SYSTEM_CALL(5);
end

%SET_PRIORITY
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
SYSTEM_CALL(6);

%SUSPEND_SELF
PARA_REG1{1,1} = input('');
SYSTEM_CALL(7);

%SUSPEND
PARA_REG1{1,1} = input('');
SYSTEM_CALL(8);

%RESUME
PARA_REG1{1,1} = input('');
SYSTEM_CALL(9);

%STOP_SELF
SYSTEM_CALL(10);

%STOP
PARA_REG1{1,1} = input('');
SYSTEM_CALL(11);

%START
n = 0;
while(n < numel(Process_Set))
    PARA_REG1{1,1} = input('');
    SYSTEM_CALL(12);
    n = n + 1;
end


%DELAYED_START
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
SYSTEM_CALL(13);

%LOCK_PREEMPTION
SYSTEM_CALL(14);

%UNLOCK_PREEMPTION
SYSTEM_CALL(15);

%GET_MY_ID
SYSTEM_CALL(16);

%% TIME_MANAGEMENT_SERVICE

%TIMED_WAIT
PARA_REG1{1,1} = input('');
SYSTEM_CALL(17);

%PERIODIC_WAIT
SYSTEM_CALL(18);

%GET_TIME
SYSTEM_CALL(19);

%REPLENISH
PARA_REG1{1,1} = input('');
SYSTEM_CALL(20);

%% INTERPARTITION_COMMUNICATION_SERVICE

%CREATE_SAMPLING_PORT
PARA_REG2{1,1} = input('');
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(21);

%WRITE_SAMPLING_MESSAGE
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(22);

%READ_SAMPLING_MESSAGE
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
SYSTEM_CALL(23);

%GET_SAMPLING_PORT_ID
PARA_REG2{1,1} = input('');
SYSTEM_CALL(24);

%GET_SAMPLING_PORT_STATUS
PARA_REG1{1,1} = input('');
SYSTEM_CALL(25);

%CREATE_QUEUING_PORT
PARA_REG2{1,1} = input('');
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
PARA_REG1{1,4} = input('');
SYSTEM_CALL(26);

%SEND_QUEUING_MESSAGE
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
PARA_REG1{1,4} = input('');
SYSTEM_CALL(27);

%RECEIVE_QUEUING_MESSAGE
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(28);

%GET_QUEUING_PORT_ID
PARA_REG2{1,1} = input('');
SYSTEM_CALL(29);

%GET_QUEUING_PORT_STATUS
PARA_REG1{1,1} = input('');
SYSTEM_CALL(30);

%CLEAR_QUEUING_PORT
PARA_REG1{1,1} = input('');
SYSTEM_CALL(31);

%CREATE_BUFFER
PARA_REG2{1,1} = input('');
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(32);

%SEND_BUFFER
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
PARA_REG1{1,4} = input('');
SYSTEM_CALL(33);

%RECEIVE_BUFFER
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(34);

%GET_BUFFER_ID
PARA_REG2{1,1} = input('');
SYSTEM_CALL(35);

%GET_BUFFER_STATUS
PARA_REG1{1,1} = input('');
SYSTEM_CALL(36);

%CREATE_BLACKBOARD
PARA_REG2{1,1} = input('');
PARA_REG1{1,1} = input('');
SYSTEM_CALL(37);

%DISPLAY_BLACKBOARD
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(38);

%READ_BLACKBOARD
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(39);

%CLEAR_BLACKBOARD
PARA_REG1{1,1} = input('');
SYSTEM_CALL(40);

%GET_BLACKBOARD_ID
PARA_REG2{1,1} = input('');
SYSTEM_CALL(41);

%GET_BLACKBOARD_STATUS
PARA_REG1{1,1} = input('');
SYSTEM_CALL(42);

%CREATE_SEMAPHORE
PARA_REG2{1,1} = input('');
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(43);

%WAIT_SEMAPHORE
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
SYSTEM_CALL(44);

%SIGNAL_SEMAPHORE
PARA_REG1{1,1} = input('');
SYSTEM_CALL(45);

%GET_SEMAPHORE_ID
PARA_REG2{1,1} = input('');
SYSTEM_CALL(46);

%GET_SEMAPHORE_STATUS
PARA_REG1{1,1} = input('');
SYSTEM_CALL(47);

%CREATE_EVENT
PARA_REG2{1,1} = input('');
SYSTEM_CALL(48);

%SET_EVENT
PARA_REG1{1,1} = input('');
SYSTEM_CALL(49);

%RESET_EVENT
PARA_REG1{1,1} = input('');
SYSTEM_CALL(50);

%WAIT_EVENT
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
SYSTEM_CALL(51);

%GET_EVENT_ID
PARA_REG2{1,1} = input('');
SYSTEM_CALL(52);

%GET_EVENT_STATUS
PARA_REG1{1,1} = input('');
SYSTEM_CALL(53);

%% HEALTH_MORNITORING_SERVICE

%REPORT_APPLICATION_MESSAGE
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
SYSTEM_CALL(54);

%CREATE_ERROR_HANDLER
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
SYSTEM_CALL(55);

%GET_ERROR_STATUS
SYSTEM_CALL(56);

%RAISE_APPLICATION_ERROR
PARA_REG1{1,1} = input('');
PARA_REG1{1,2} = input('');
PARA_REG1{1,3} = input('');
SYSTEM_CALL(57);





