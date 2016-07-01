function [BLACKBOARD_ID,RETURN_CODE ] = GET_BLACKBOARD_ID(BLACKBOARD_NAME )
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
global RETURN_CODE_TYPE;
global Blackboard_Set;


if INVALID_NAME(BLACKBOARD_NAME)
     RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    BLACKBOARD_ID=0;
    return
end

flag=0;
s=0;
for i=1:256
    if ~isempty(Blackboard_Set{1,i})&&strcmp(Blackboard_Set{1,i}.NAME,BLACKBOARD_NAME)
        flag=1;
        s=i;
    end
end
if flag==0
    RETURN_CODE = RETURN_CODE_TYPE. INVALID_CONFIG;
    BLACKBOARD_ID=0;
    return;

end
BLACKBOARD_ID = Blackboard_Set{1,s}.ID;
RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;








end


