function [ bool ] = INVALID_MAX_NB_MESSAGE( input )
if input>0 && input<2147483648
    bool=0;
else 
    bool=1;
end
return;
end

