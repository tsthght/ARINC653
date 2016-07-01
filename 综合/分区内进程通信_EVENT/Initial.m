Event_Set{1,1}.WAITING_PROCESSES = [1,2,3,4,5];
for i = 1:5
    Waiting_Event_Set{Event_Set{1,1}.ID,i} = i;
    Waiting_Timer_Set{1,i} = i;
    Waiting_Processes_set{1,i} = i;
end

 Process_Set{1,1} = PROCESS_TYPE(1,'a',0,2,2,3,1,2,3,4,1,2);
 Process_Set{1,2} = PROCESS_TYPE(2,'b',0,2,2,3,1,2,3,4,1,2);
 Process_Set{1,3} = PROCESS_TYPE(3,'c',0,2,2,3,1,2,3,4,1,2);
 Process_Set{1,4} = PROCESS_TYPE(4,'d',0,2,2,3,1,2,3,4,1,2);
 Process_Set{1,5} = PROCESS_TYPE(5,'e',0,2,2,3,1,2,3,4,1,2);



