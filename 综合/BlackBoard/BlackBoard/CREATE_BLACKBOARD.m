function  [BLACKBOARD_ID,RETURN_CODE] = CREATE_BLACKBOARD( BLACKBOARD_NAME,MAX_MESSAGE_SIZE )

global RETURN_CODE_TYPE;
global SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS;
global Blackboard_Set;
global Current_Partition_STATUS;
global SYSTEM_NUMBER_OF_BLACKBOARDS;
%global EMPTY_INDICATOR_TYPE;




if INVALID_NAME(BLACKBOARD_NAME)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    BLACKBOARD_ID=0;
	return;
end 

if INVALID_MAX_MESSAGE_SIZE(MAX_MESSAGE_SIZE)
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_PARAM;
    BLACKBOARD_ID=0;
    return;
end

if SYSTEM_NUMBER_OF_BLACKBOARDS == SYSTEM_LIMIT_NUMBER_OF_BLACKBOARDS
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_CONFIG;
    BLACKBOARD_ID=0;
    return;
end

flag=0;
for i=1:256
    if ~isempty(Blackboard_Set{1,i})&&strcmp(Blackboard_Set{1,i}.NAME,BLACKBOARD_NAME)
        flag=1;
    end
end

if flag==1
    RETURN_CODE = RETURN_CODE_TYPE.NO_ACTION;
    BLACKBOARD_ID=0;
    return;

end

if Current_Partition_STATUS.OPERATING_MODE == OPERATING_MODE_TYPE.NORMAL
    RETURN_CODE = RETURN_CODE_TYPE.INVALID_MODE;
    BLACKBOARD_ID=0;
    return;

end

        BBoard.EMPTY_INDICATOR = EMPTY_INDICATOR_TYPE.EMPTY;
     	BBoard.MAX_MESSAGE_SIZE = MAX_MESSAGE_SIZE;
        BBoard.WAITING_PROCESSES = 0;
        BBoard.LENGTH=0;
        BBoard.MESSAGE_ADDR=cell(1,MAX_MESSAGE_SIZE);
        
        BBoard.NAME = BLACKBOARD_NAME;
        
        for ID=1:255
            flag=0;
            for i=1:255
                if ~isempty(Blackboard_Set{1,i}) && Blackboard_Set{1,i}.ID==ID 
                    flag=1;
                    break;
                end
            end
            if flag ==0
                BBoard.ID=ID;
                 break;
            end
           
            
        end
       for i=1:255
         if isempty(Blackboard_Set{1,i})
             Blackboard_Set{1,i}=BBoard;
              break;
         end
        
       end
      	SYSTEM_NUMBER_OF_BLACKBOARDS = SYSTEM_NUMBER_OF_BLACKBOARDS + 1;
        BLACKBOARD_ID = BBoard.ID;
      	RETURN_CODE = RETURN_CODE_TYPE.NO_ERROR;






end

