function [ ID ] = GENERATE_ID( )
%GENERATE_ID �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

     ID = round( 1+(65535) *rand(1,1) );

end

