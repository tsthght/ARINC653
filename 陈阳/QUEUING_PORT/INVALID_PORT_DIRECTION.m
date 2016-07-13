function [ bool ] =INVALID_PORT_DIRECTION( input)

global PORT_DIRECTION_TYPE;

if input~=PORT_DIRECTION_TYPE.SOURCE &&   input~= PORT_DIRECTION_TYPE.DESTINATION
    bool=1;
else
    bool=0;
end

return;
end

