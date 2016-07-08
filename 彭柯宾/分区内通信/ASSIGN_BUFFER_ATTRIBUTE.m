global BUFFER_ATTRIBUTE

BUFFER_ATTRIBUTE.NB_MESSAGE=0;
BUFFER_ATTRIBUTE.MAX_NB_MESSAGE=4;
BUFFER_ATTRIBUTE.MAX_MESSAGE_SIZE=8;
BUFFER_ATTRIBUTE.WAITING_PROCESSES=0;
BUFFER_ATTRIBUTE.QUEUING_DISCIPLINE=0;

global DATA_ZONE;
% global MAX_NUMBER_OF_PROCESS;

message = 'recentlyintroducedcontinuousSkipgrammodelisanef?cientmethodforlearninghighqualitydistributedvectorrepresentationsthatcapturealargenumberofprecisesyntacticandsemanticwordrelationshipsInthispaper';

for i=1:length(message)
    DATA_ZONE{1,i} = message(i); 
end

