function COPY( BUFFER_ID,MESSAGE_ADDR,LENGTH )
%COPY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

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
