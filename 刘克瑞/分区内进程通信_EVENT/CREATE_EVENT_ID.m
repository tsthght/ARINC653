function [EVENT_ID] = CREATE_EVENT_ID()

global MAX_NUMBER_OF_EVENTS;

EVENT_ID = round( 1+(MAX_NUMBER_OF_EVENTS-1) *rand(1,1) );

end
