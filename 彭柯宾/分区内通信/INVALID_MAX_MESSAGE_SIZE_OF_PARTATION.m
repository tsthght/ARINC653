function [flag] = INVALID_MAX_MESSAGE_SIZE(MAX_MESSAGE_SIZE)
flag = 0;
if 0>MAX_MESSAGE_SIZE && MAX_MESSAGE_SIZE>255
    flag = 1;
else
    flag = 0;
end
