function [RETURN_CODE] = SUSPEND (PROCESS_ID)

global Process_Set;
global PROCESS_STATE_TYPE;
global RETURN_CODE_TYPE;
global Current_Partition_STATUS;
global NULL_PROCESS_ID;
global Current_Process;



%�ж�ID�����Ƿ�Ϸ�

if INVALID_ID(PROCESS_ID) == 0 || Current_Process.ID == PROCESS_ID
	 RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
     return;
end

%�ж�ģʽ�Ƿ��쳣
if Current_Partition_STATUS.LOCK_LEVEL~=0 && PROCESS_ID == NULL_PROCESS_ID
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%

%��PCB���ҵ�Ҫ����Ľ���
PRO = Process_Set{1,FIND_PROCESS_INDEX( PROCESS_ID )};

%�������������װ״̬��ģʽ����
if PRO.PROCESS_STATE == PROCESS_STATE_TYPE.DORMANT
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%��������������Եģ�ģʽ����
if PRO.PERIOD ~= 0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    return;
end

%��������ǵȴ�״̬�������κβ���
if PRO.PROCESS_STATE == PROCESS_STATE_TYPE.WAITING
    RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    return;
    
%�����̹���
else 
            DELETE_FROM_READY(PROCESS_ID);
            PRO.PROCESS_STATE = PROCESS_STATE_TYPE.WAITING;
            Process_Set{1,FIND_PROCESS_INDEX( PROCESS_ID )} = PRO;
            INSERT_INTO_WAITING(PROCESS_ID);
            RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
            return;
end


