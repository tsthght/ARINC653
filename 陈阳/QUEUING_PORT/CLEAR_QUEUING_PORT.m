function [RETURN_CODE ] = CLEAR_QUEUING_PORT(QUEUING_PORT_ID )
global RETURN_CODE_TYPE;

global Queuing_Set;


 TEMP_NUMBER = 0;


if INVALID_ID(QUEUING_PORT_ID)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return;
end

flag=0;
m=0;
for i=1:512
    if ~isempty(Queuing_Set{1,i})&&Queuing_Set{1,i}.ID==QUEUING_PORT_ID
        flag=1;
        m=i;
        
        break
    end
end
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return;
end

if Queuing_Set{1,m}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.DESTINATION
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return;
    
end
while TEMP_NUMBER < Queuing_Set{1,m}.MAX_NB_MESSAGE
    Queuing_Set{1,m}.QUEUE{1,TEMP_NUMBER+1}=[];
    TEMP_NUMBER=TEMP_NUMBER+1;
end
Queuing_Set{1,m}.NB_MESSAGE = 0;
Queuing_Set{1,m}.FIRST_MESSAGE.MESSAGE_ADDR=cell(1,Queuing_Set{1,m}.MAX_MESSAGE_SIZE);
 Queuing_Set{1,m}.FIRST_MESSAGE.LENGTH=0;
  Queuing_Set{1,m}.FIRST_MESSAGE.NEXT=0;
 Queuing_Set{1,m}.LAST_MESSAGE.MESSAGE_ADDR=cell(1,Queuing_Set{1,m}.MAX_MESSAGE_SIZE);
 Queuing_Set{1,m}.LAST_MESSAGE.LENGTH=0;
 Queuing_Set{1,m}.LAST_MESSAGE.NEXT=0;
RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
	return;
end

