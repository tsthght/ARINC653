global SAMPLING_PORT_ATTRIBUTE
% SAMPLING_PORT_ATTRIBUTE.ID=0;
% SAMPLING_PORT_ATTRIBUTE.NAME='a';
% SAMPLING_PORT_ATTRIBUTE.REFRESH_PERIOD=0;
% SAMPLING_PORT_ATTRIBUTE.MAX_MESSAGE_SIZE=8;
% SAMPLING_PORT_ATTRIBUTE.PORT_DIRECTION=12;
SAMPLING_PORT_ATTRIBUTE.LAST_MSG_VALIDITY=16;

global SPortTable
SPortTable.MAX_MESSAGE_SIZE=8;
SPortTable.PORT_DIRECTION=1;
SPortTable.SAMPLING_PORT_NAME='port2';
message = 'recentlyintroducedcontinuousSkipgrammodelisanef?cientmethodforlearninghighqualitydistributedvectorrepresentationsthatcapturealargenumberofprecisesyntacticandsemanticwordrelationshipsInthispaper';
global DATA_ZONE;
for i=1:length(message)
    DATA_ZONE{1,i} = message(i); 
end
