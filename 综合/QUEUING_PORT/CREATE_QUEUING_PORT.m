function [QUEUING_PORT_ID,RETURN_CODE ] = CREATE_QUEUING_PORT( QUEUING_PORT_NAME,MAX_MESSAGE_SIZE,MAX_NB_MESSAGE,PORT_DIRECTION,QUEUING_DISCIPLINE )
global RETURN_CODE_TYPE;
global SYSTEM_NUMBER_OF_QUEUING_PORTS;
global Queuing_Set;
global Configuration_table;
 global Current_Partition_STATUS;
 global MAX_NUMBER_OF_QUEUING_PORTS;
global PARTITION_CONFIG;

if INVALID_NAME(QUEUING_PORT_NAME)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_ID=0;
	return;
end 

if INVALID_MAX_MESSAGE_SIZE(MAX_MESSAGE_SIZE)
     RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_ID=0;
	return;
end

if INVALID_MAX_NB_MESSAGE(MAX_NB_MESSAGE)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_ID=0;
	return;
end

if INVALID_PORT_DIRECTION(PORT_DIRECTION)
     RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_ID=0;
	return;
end

if INVALID_QUEUING_DISCIPLINE(QUEUING_DISCIPLINE)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_ID=0;
	return;
end

if SYSTEM_NUMBER_OF_QUEUING_PORTS==MAX_NUMBER_OF_QUEUING_PORTS
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    QUEUING_PORT_ID=0;
	return;
end

flag=0;
for i=1:255
    if ~isempty(Configuration_table{1,i}) && strcmp(Configuration_table{1,i}.NAME,QUEUING_PORT_NAME) && strcmp(Configuration_table{1,i}.CURRENT_PARTITION_NAME, PARTITION_CONFIG.NAME)
        flag=1;
        QPortTable=Configuration_table{1,i};
        break;
    end
end
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    QUEUING_PORT_ID=0;
	return;
end

 flag=0;
for i=1:512
    if ~isempty(Queuing_Set{1,i}) && Queuing_Set{1,i}.NAME== QUEUING_PORT_NAME
        flag=1;
        break;
    end
end
if flag==1 
     RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    QUEUING_PORT_ID=0;
	return;
end

if MAX_MESSAGE_SIZE ~= QPortTable.MAX_MESSAGE_SIZE
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    QUEUING_PORT_ID=0;
	return;
end

if MAX_NB_MESSAGE ~= QPortTable.MAX_NB_MESSAGE
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    QUEUING_PORT_ID=0;
	return;
end

if PORT_DIRECTION ~= QPortTable.PORT_DIRECTION
     RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    QUEUING_PORT_ID=0;
	return;
end
 
if Current_Partition_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    QUEUING_PORT_ID=0;
	return;
end

 QPort.NAME = QUEUING_PORT_NAME;
 QPort.NB_MESSAGE = 0;
 QPort.MAX_NB_MESSAGE = MAX_NB_MESSAGE;
 QPort.MAX_MESSAGE_SIZE = MAX_MESSAGE_SIZE;
 QPort.PORT_DIRECTION = PORT_DIRECTION;
 QPort.WAITING_PROCESSES = 0;
 QPort.QUEUE=cell(1,MAX_NB_MESSAGE-1);
 QPort.FIRST_MESSAGE.MESSAGE_ADDR=cell(1,MAX_MESSAGE_SIZE);
 QPort.FIRST_MESSAGE.LENGTH=0;
  QPort.FIRST_MESSAGE.NEXT=0;
 QPort.LAST_MESSAGE.MESSAGE_ADDR=cell(1,MAX_MESSAGE_SIZE);
 QPort.LAST_MESSAGE.LENGTH=0;
 QPort.LAST_MESSAGE.NEXT=0;
  for ID=1:512
            flag=0;
            for i=1:512
                if ~isempty(Queuing_Set{1,i}) && Queuing_Set{1,i}.ID==ID 
                    flag=1;
                    break;
                end
            end
            if flag ==0
                QPort.ID=ID;
                 break;
            end
           
            
  end
        
  for i=1:512
         if isempty(Queuing_Set{1,i})
             Queuing_Set{1,i}=QPort;
              break;
         end
  end
  SYSTEM_NUMBER_OF_QUEUING_PORTS=SYSTEM_NUMBER_OF_QUEUING_PORTS+1;
  QUEUING_PORT_ID = QPort.ID; 
  RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
  return;


end

