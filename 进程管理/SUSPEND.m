function RETURN_CODE = SUSPEND (id)

global Process_Set
global INFINITE_TIME_VALUE
global PROCESS_STATE_TYPE
global Ready_Process_Set
global Waiting_Process_Set
global RETURN_CODE_TYPE
global Current_Partition_STATUS
global ERORR_HANDLER_PROCESS_ID


%�ж�ID�����Ƿ�Ϸ�
flag=INVALID_ID(id);
if flag == 0
	 RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
     disp(RETURN_CODE);
     return;
end

%�ж�ģʽ�Ƿ��쳣
if Current_Partition_STATUS.LOCK_LEVEL~=0 && id == ERORR_HANDLER_PROCESS_ID
    fprintf('1');
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%��PCB���ҵ�Ҫ����Ľ���
for i = 1:255
    if Process_Set{1,i}.ID==id
    break;    
    end
   
end

%�������������װ״̬��ģʽ����
if Process_Set{1,i}.PROCESS_STATE == PROCESS_STATE_TYPE.DORMANT
    fprintf('2');
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%��������������Եģ�ģʽ����
if Process_Set{1,i}.PERIOD ~= INFINITE_TIME_VALUE
    fprintf('3');
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%��������ǵȴ�״̬�������κβ���
if Process_Set{1,i}.PROCESS_STATE == PROCESS_STATE_TYPE.WAITING
    RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    return;
    
%�����̹���
else 
           DELETE_FROM_READY(id);
            Process_Set{1,i}.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
            INSERT_INTO_WAITING(id);
            RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
            return;
end


