function [flag] = INVALID_REFRESH_PERIOD( REFRESH_PERIOD )
%INVALID_REFRESH_PERIOD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
flag = 0;
if 0>REFRESH_PERIOD && REFRESH_PERIOD>255
    flag = 1;
else
    flag = 0;
end

end





