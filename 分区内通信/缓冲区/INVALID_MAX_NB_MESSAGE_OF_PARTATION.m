function [flag] = INVALID_MAX_NB_MESSAGE(MAX_NB_MESSAGE)
flag = 0;
if MAX_NB_MESSAGE>0 && MAX_NB_MESSAGE<255
    flag = 1;
else
    flag =0;
end
