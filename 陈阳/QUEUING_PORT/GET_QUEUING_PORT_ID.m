function [ QUEUING_PORT_ID,RETURN_CODE ] = GET_QUEUING_PORT_ID( QUEUING_PORT_NAME )
global RETURN_CODE_TYPE;
global Queuing_Set;


if INVALID_NAME(QUEUING_PORT_NAME)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    QUEUING_PORT_ID=0;
	return;
end

if numel(Queuing_Set)~=0
    flag=0;
    for i=1:numel(Queuing_Set)
        if ~isempty(Queuing_Set{1,i})&&strcmp(Queuing_Set{1,i}.NAME,QUEUING_PORT_NAME)
            flag=1;
            QPort=Queuing_Set{1,i};
            break
        end
    end
end
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    QUEUING_PORT_ID=0;
	return;
end

QUEUING_PORT_ID = QPort.ID;
RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
return;


end

