function [LENGTH ]=PASTE( BUFFER_ID,MESSAGE_ADDR )
%PASTE 此处显示有关此函数的摘要
%   此处显示详细说明

global DATA_ZONE;
global BUFFER;
global MAX_NUMBER_OF_PROCESS
LENGTH =0;
for i = 1:MAX_NUMBER_OF_PROCESS
    if isempty(BUFFER{i,1})==0 && BUFFER{i,1}.ID == BUFFER_ID
        for j = MESSAGE_ADDR:MAX_NUMBER_OF_PROCESS
            if isempty( BUFFER{i,j} )==0
                 DATA_ZONE{1,j} = BUFFER{i,j};
                 LENGTH = LENGTH +1;
                 BUFFER{i,j} = [];
            end
            
        end
     
    end
end

end

