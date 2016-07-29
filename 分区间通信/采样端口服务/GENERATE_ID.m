function [ ID ] = GENERATE_ID( )
%GENERATE_ID 此处显示有关此函数的摘要
%   此处显示详细说明

     ID = round( 1+(65535) *rand(1,1) );

end

