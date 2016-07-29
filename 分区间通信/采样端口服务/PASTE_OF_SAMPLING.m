function [LENGTH ]=PASTE( SAMPLING_PORT_ID,DES_SAMPLING_PORT_ID,MESSAGE_ADDR )
%PASTE 此处显示有关此函数的摘要
%   此处显示详细说明

global DATA_ZONE;
global SAMPING_PORT;
global MAX_NUMBER_OF_PROCESS
LENGTH =0;
for i = 1:MAX_NUMBER_OF_PROCESS
    if isempty(SAMPING_PORT{i,1})==0 && SAMPING_PORT{i,1}.ID == SAMPLING_PORT_ID
        for k = 1:MAX_NUMBER_OF_PROCESS
            if isempty(SAMPING_PORT{k,1})==0 && SAMPING_PORT{k,1}.ID == DES_SAMPLING_PORT_ID
                 for j = MESSAGE_ADDR:MAX_NUMBER_OF_PROCESS
                    if isempty( SAMPING_PORT{i,j} )==0
                        SAMPING_PORT{k,j} = SAMPING_PORT{i,j};
                        LENGTH = LENGTH +1;
                        SAMPING_PORT{i,j} = [];
                    end
            
                 end
                
            end
        end
        
        
       
     
    end
end

end

