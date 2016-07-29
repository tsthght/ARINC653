function COPY( BUFFER_ID,MESSAGE_ADDR,LENGTH )
%COPY 此处显示有关此函数的摘要
%   此处显示详细说明

global DATA_ZONE;
global BUFFER;
global MAX_NUMBER_OF_PROCESS
for i = 1:MAX_NUMBER_OF_PROCESS
    if isempty(BUFFER{i,1})==0 && BUFFER{i,1}.ID == BUFFER_ID
        for j = MESSAGE_ADDR:MESSAGE_ADDR+LENGTH
            BUFFER{i,j}= DATA_ZONE{1,j};
           
              DATA_ZONE{1,j} = [];
        end
       
    end
    
end
