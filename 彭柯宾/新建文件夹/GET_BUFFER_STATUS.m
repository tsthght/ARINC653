function [  BUFFER_STATUS,RETURN_CODE] = GET_BUFFER_STATUS( BUFFER_ID )
%GET_BUFFER_STATUS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global BUFFER_STATUS
global RETURN_CODE_TYPE
global Buffer_set
global Buffer_id_set
if INVALID_ID(BUFFER_ID)==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    return;
end
  index = find(Buffer_id_set==BUFFER_ID);
   BUFFER_STATUS.NB_MESSAGE=Buffer_set{1,index}.NB_MESSAGE;        
   BUFFER_STATUS.MAX_NB_MESSAGE=Buffer_set{1,index}.MAX_NB_MESSAGE;   
   BUFFER_STATUS.MAX_MESSAGE_SIZE=Buffer_set{1,index}.MAX_MESSAGE_SIZE;    
   BUFFER_STATUS.WAITING_PROCESSES=Buffer_set{1,index}.WAITING_PROCESSES;
   RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
   
end

