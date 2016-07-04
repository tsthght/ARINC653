function [RETURN_CODE] = SYSTEM_CALL(systemcall_id)

global SYS_GET_PROCESS_ID;
global SYS_GET_PROCESS_STATUS;
global SYS_CREATE_PROCESS;
global SYS_SET_PRIORITY;
global SYS_SUSPEND_SELF;
global SYS_SUSPEND;
global SYS_RESUME;
global SYS_STOP_SELF;
global SYS_STOP;
global SYS_START;
global SYS_DELAYED_START;
global SYS_LOCK_PREEMPTION;
global SYS_UNLOCK_PREEMPTION;
global SYS_GET_MY_ID;

switch(systemcall_id)
    case SYS_GET_PROCESS_ID
        RETURN_CODE = GET_PROCESS_ID(PROCESS_NAME);
        return;
    case SYS_GET_PROCESS_STATUS
        RETURN_CODE = GET_PROCESS_STATUS(PROCESS_ID);
        return;
    case SYS_CREATE_PROCESS
        RETURN_CODE = CREATE_PROCESS(ATTRIBUTES);
        return;
    case SYS_SET_PRIORITY
        RETURN_CODE = SET_PRIORITY(PROCESS_ID,PRIORITY);
        return;
    case SYS_SUSPEND_SELF
        RETURN_CODE = SUSPEND_SELF(TIME_OUT);
        return;
    case SYS_SUSPEND
        RETURN_CODE = SUSPEND(PROCESS_ID);
        return;
    case SYS_RESUME
        RETURN_CODE = RESUME(PROCESS_ID);
        return;
    case SYS_STOP_SELF
        RETURN_CODE = STOP_SELF();
        return;
    case SYS_STOP
        RETURN_CODE = STOP(PROCESS_ID);
        return;
    case SYS_START
        RETURN_CODE = START(PROCESS_ID);
        return;
    case SYS_DELAYED_START
        RETURN_CODE = DELAYED_START(PROCESS_ID,DELAY_TIME);
        return;
    case SYS_LOCK_PREEMPTION
        RETURN_CODE = LOCK_PREEMPTION();
        return;
    case SYS_UNLOCK_PREEMPTION
        RETURN_CODE = UNLOCK_PREEMPTION();
        return;
    case SYS_GET_MY_ID
        RETURN_CODE = GET_MY_ID();
        return;
end