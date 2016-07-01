function [ SAMPLING_PORT_ID,RETURN_CODE ] = GET_SAMPLING_PORT_ID( SAMPLING_PORT_NAME )
%GET_SAMPLING_PORT_ID 此处显示有关此函数的摘要
%   此处显示详细说明
		
	    global RETURN_CODE_TYPE
  		if(INVALID_NAME(SAMPLING_PORT_NAME))
  		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
  		global Sampling_obj
  		
        for i =1:length(Sampling_obj)
            if Sampling_obj{1,i}.NAME ==  SAMPLING_PORT_NAME
                break
            end
        end
        
  		
  		SAMPLING_PORT_ID = Sampling_obj{1,i}.ID
  		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
  		return;



end

