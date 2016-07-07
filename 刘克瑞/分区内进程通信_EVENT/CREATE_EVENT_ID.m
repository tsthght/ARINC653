function [EVENT_ID] = CREATE_EVENT_ID()

    global MAX_NUMBER_OF_EVENTS;

    id = round( 1+(MAX_NUMBER_OF_EVENTS-1) *rand(1,1) );

    if EVENT_ID_EXIST(id) == 1
        EVENT_ID = -1;
    else
        EVENT_ID = id;
    end

end
