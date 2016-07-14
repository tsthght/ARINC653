classdef PARTITION_STATUS_TYPE
    properties
        IDENTIFIER;
        PERIOD;
        DURATION;
        LOCK_LEVEL;
        OPERATING_MODE;
        START_CONDITION;
    end
    
    methods
        function PARTITION_STATUS = PARTITION_STATUS_TYPE(id,period,duration,lock_level,operating_mode,start_condition)
                PARTITION_STATUS.IDENTIFIER = id;
                PARTITION_STATUS.PERIOD = period;
                PARTITION_STATUS.DURATION = duration;
                PARTITION_STATUS.LOCK_LEVEL = lock_level;
                PARTITION_STATUS.OPERATING_MODE = operating_mode;
                PARTITION_STATUS.START_CONDITION = start_condition;
        end
    end
end