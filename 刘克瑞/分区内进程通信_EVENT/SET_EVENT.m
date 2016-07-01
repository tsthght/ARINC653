function [RETURN_CODE] = SET_EVENT(EVENT_ID)

global Event_Set;
global RETURN_CODE_TYPE;
global Current_Partition_STATUS;
global Waiting_Timer_Set;
global Waiting_Event_Set;
global Process_Set;
global PROCESS_STATE_TYPE;
global Ready_Processes_set;
global Waiting_Processes_set;
global EVENT_STATE_TYPE;


flag = EVENT_ID_EXIST(EVENT_ID);
if flag == 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM
    return;
end

for i = 1:256
    if  Event_Set{1,i}.ID == EVENT_ID
        if Event_Set{1,i}.STATE == EVENT_STATE_TYPE.UP
            disp('THIS EVENT HAS ALREADY BEEN SET!!');
            return;
        else 
            Event_Set{1,i}.STATE=EVENT_STATE_TYPE.UP;
            index = i;
            break;
        end
    end
end

if numel(Event_Set{1,index}.WAITING_PROCESSES) > 0
    count = numel(Event_Set{1,index}.WAITING_PROCESSES);
        for i = 1:255
           if isempty(Waiting_Event_Set{Event_Set{1,index}.ID,i}) == 0;
                for j = i:255
                    if Waiting_Event_Set{Event_Set{1,index}.ID,i} == Waiting_Timer_Set{1,j}
                       Waiting_Timer_Set{1,j}=[];
                    end
                    
                    if Waiting_Processes_set{1,j} == Waiting_Event_Set{Event_Set{1,index}.ID,i}
                        Waiting_Processes_set{1,j} = [];
                    end
                    
                    if isempty(Process_Set{1,j}) == 0
                       if Waiting_Event_Set{Event_Set{1,index}.ID,i} == Process_Set{1,j}.ID
                           Process_Set{1,j}.PROCESS_STATE = PROCESS_STATE_TYPE.READY; 
                           INSERT_INTO_READY(Process_Set{1,j}.ID); 
                       end
                    end
                    break;
                end
                Waiting_Event_Set{Event_Set{1,index}.ID,i} = [];
                if i <= count
                    Event_Set{1,index}.WAITING_PROCESSES(1) = [];
                end
           end
        end
end       
        if Current_Partition_STATUS.LOCK_LEVEL == 0
            disp('Ask_For_Process_Scheduling()');
        end    


 RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
 return;
end


