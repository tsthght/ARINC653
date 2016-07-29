function [ bool] = INVALID_LENGTH( l)

max=1000000;
if l>max
    bool=1;
else
    bool=0;
end
return;
end

