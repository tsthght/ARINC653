function [ b ] = INVALID_TIME_OUT( a )

if a<9223372036854775808 && a>-9223372036854775809
    b=0;
else
    b=1;
return;
end

