function [FLAG] = INVAILD_OPERATING_MODE(OPERATING_MODE)

global OPERATING_MODE_TYPE;

FLAG = 0;
if OPERATING_MODE ~= OPERATING_MODE_TYPE.IDLE && OPERATING_MODE ~= OPERATING_MODE_TYPE.COLD_START && OPERATING_MODE ~= OPERATING_MODE_TYPE.WARM_START && OPERATING_MODE ~= OPERATING_MODE_TYPE.NORMAL
    FLAG = 1;
    return;
end

end