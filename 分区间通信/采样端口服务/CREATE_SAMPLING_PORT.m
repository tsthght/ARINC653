function [ SAMPLING_PORT_ID,RETURN_CODE ] = CREATE_SAMPLING_PORT(SAMPLING_PORT_NAME,REFRESH_PERIOD,MAX_MESSAGE_SIZE,PORT_DIRECTION)
%CREATE_SAMPLING_PORT 此处显示有关此函数的摘要
%   此处显示详细说明
	global RETURN_CODE_TYPE;
    global SAMPLING_PORT_ATTRIBUTE;
    global Current_Partition_STATUE;
    global OPERATING_MODE_TYPE;
    global MAX_NUMBER_OF_PROCESS;
    global SAMPING_PORT
   
		if(INVALID_NAME_OF_SAMPLING(SAMPLING_PORT_NAME)==1)
  		    
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
			return;
        end
        
		if(INVALID_MAX_MESSAGE_SIZE_OF_SAMPLING(MAX_MESSAGE_SIZE)==0)
		   
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
		if(INVALID_PORT_DIRECTION_OF_SAMPLING(PORT_DIRECTION))
		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
		if(INVALID_REFRESH_PERIOD_OF_SAMPLING(REFRESH_PERIOD))
		
			RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    		return;
        end
        
		 global SYSTEM_NUMBER_OF_SAMPLING_PORTS
         global MAX_NUMBER_OF_SAMPLING_PORTS
      
		if(SYSTEM_NUMBER_OF_SAMPLING_PORTS == MAX_NUMBER_OF_SAMPLING_PORTS )
    		
    		RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    		return;
        end
        global SPortTable					
  		if(MAX_MESSAGE_SIZE ~= SPortTable.MAX_MESSAGE_SIZE)
   			
   			RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
   			return;
        end
        
   		if(PORT_DIRECTION ~= SPortTable.PORT_DIRECTION)
   			
   			RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
   			return;
        end
        
   		if(SAMPLING_PORT_NAME ~= SPortTable.SAMPLING_PORT_NAME)
   			 
   			RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
   			return;
        end
        
 		if(Current_Partition_STATUE.OPERATING_MODE ==  OPERATING_MODE_TYPE.NORMAL)
   		
   			RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
   			return;
        end
     
 		global Sampling_Set;

        SAMPLING_PORT_ATTRIBUTE.ID=GENERATE_ID( );
        
      
        SPort = SAMPLING_PORT_CLASS(SAMPLING_PORT_ATTRIBUTE.ID,SAMPLING_PORT_NAME,REFRESH_PERIOD, MAX_MESSAGE_SIZE,PORT_DIRECTION,SAMPLING_PORT_ATTRIBUTE.LAST_MSG_VALIDITY);
       
        
         for i = 1:MAX_NUMBER_OF_PROCESS 
            if isempty( Sampling_Set{1,i} )
                Sampling_Set{1,i} = SPort;
                SAMPING_PORT{i,1} = SPort;
                SYSTEM_NUMBER_OF_SAMPLING_PORTS = SYSTEM_NUMBER_OF_SAMPLING_PORTS+1;
               break;
            end
        end
%         Sampling_Set(numel(Sampling_Set)+1) =  round( 1+MAX_NUMBER_OF_PROCESS *rand(1,1) );
%  		SPort.NAME = SAMPLING_PORT_NAME;
%  		SPort.REFRESH_PERIOD = REFRESH_PERIOD;
%  		SPort.MAX_MESSAGE_SIZE = MAX_MESSAGE_SIZE;
%  		SPort.PORT_DIRECTION = PORT_DIRECTION;
        global Sampling_obj
        Sampling_obj{1,length(Sampling_obj)+1} = SPort;
        
        
 		SAMPLING_PORT_ID = SAMPLING_PORT_ATTRIBUTE.ID; 
 	    RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;
 end

