function [EVENT_ID] = CREATE_EVENT_ID()

    global MAX_NUMBER_OF_EVENTS;

    id = round( 1+(MAX_NUMBER_OF_EVENTS-1) *rand(1,1) );

    while EVENT_ID_EXIST(id) == 1
        id = round( 1+(MAX_NUMBER_OF_EVENTS-1) *rand(1,1) );
    end
    
    EVENT_ID = id;
    

end
