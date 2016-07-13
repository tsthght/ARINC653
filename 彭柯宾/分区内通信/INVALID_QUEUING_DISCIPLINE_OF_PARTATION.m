function [flag] = INVALID_QUEUING_DISCIPLINE(QUEUING_DISCIPLINE)
flag = 0;
if QUEUING_DISCIPLINE == 1 || QUEUING_DISCIPLINE == 0
    flag = 1;
else
    flag = 0;
end

