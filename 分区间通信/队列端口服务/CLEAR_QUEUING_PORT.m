function [RETURN_CODE ] = CLEAR_QUEUING_PORT(QUEUING_PORT_ID )

global RETURN_CODE_TYPE;
global PORT_DIRECTION_TYPE;
global Queuing_Set;

if INVALID_ID(QUEUING_PORT_ID)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return;
end

location=0;
if numel(Queuing_Set)~=0
    flag=0;
    for i=1:numel(Queuing_Set)
        if ~isempty(Queuing_Set{1,i})&&Queuing_Set{1,i}.ID==QUEUING_PORT_ID
            flag=1;
            location=i;
            break
        end
    end
end
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return;
end

if Queuing_Set{1,location}.PORT_DIRECTION ~= PORT_DIRECTION_TYPE.DESTINATION
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
	return;   
end


Queuing_Set{1,location}.NB_MESSAGE = 0;
Queuing_Set{1,location}.WAITING_PROCESSES = 0;
Queuing_Set{1,location}.QUEUE=[];
Queuing_Set{1,location}.FIRST_MESSAGE=0;
Queuing_Set{1,location}.LAST_MESSAGE=0;
RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
return;

end

