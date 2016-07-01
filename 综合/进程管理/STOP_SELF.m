function STOP_SELF( )
global Current_Partition_STATUS;
global Current_Process;
global Running_Processes_set;
global Dormant_Processes_set;
global Previous_Process;
global PROCESS_STATE_TYPE ;
global ERROR_HANDLER_PROCESS_ID;
if Current_Process.ID ~= ERROR_HANDLER_PROCESS_ID
    Current_Partition_STATUS.LOCK_LEVEL = 0;
    Current_Process.PROCESS_STATE = PROCESS_STATE_TYPE.DORMANT;
    DELETE_FROM_RUNNING(Current_Process.ID);
   INSERT_INTO_DORMANT(Current_Process.ID);
     
end
if Current_Process.ID == ERROR_HANDLER_PROCESS_ID && Current_Partition_STATUS.LOCK_LEVEL ~= 0 && Previous_Process.PROCESS_STATE ~= PROCESS_STATE_TYPE.DORMANT
   Current_Process=Previous_Process;
    return
else
    disp('Ask_For_Process_Scheduling');
    return
end



end

