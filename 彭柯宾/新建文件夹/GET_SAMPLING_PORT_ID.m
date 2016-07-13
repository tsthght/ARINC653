function [ SAMPLING_PORT_ID,RETURN_CODE ] = GET_SAMPLING_PORT_ID( SAMPLING_PORT_NAME )
%GET_SAMPLING_PORT_ID �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
		
	    global RETURN_CODE_TYPE
  		if(INVALID_NAME_OF_SAMPLING(SAMPLING_PORT_NAME)==0)
  		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
  		global Sampling_Set
  		
        for i =1:length(Sampling_Set)
            if isempty(Sampling_Set{1,i}) == 0
                if Sampling_Set{1,i}.SAMPLING_PORT_NAME ==  SAMPLING_PORT_NAME
                    ANS=i;
                end
            end
            
        end
        
  		
  		SAMPLING_PORT_ID = Sampling_Set{1,ANS}.ID
  		RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR
  		return;



end

