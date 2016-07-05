classdef ERROR_PROCESS_ATTRIBUTE_TYPE 
    properties
        ERROR_CODE;
        LENGTH;   
        FAILED_PROCESS_ID;
        FAILED_ADDRESS;
    end
    
    methods
        function ERROR_PROCESS = ERROR_PROCESS_ATTRIBUTE_TYPE (error_code,length,failed_process_id,failed_address)
                ERROR_PROCESS.ERROR_CODE = error_code; 
                ERROR_PROCESS.LENGTH = length;
                ERROR_PROCESS.FAILED_PROCESS_ID = failed_process_id;
                ERROR_PROCESS.FAILED_ADDRESS = failed_address;
        end           
    end
     
end
