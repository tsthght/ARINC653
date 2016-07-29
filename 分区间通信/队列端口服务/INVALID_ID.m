function [ bool] = INVALID_ID( ID )

bool=1;

    if ID>0 && ID<2147483648
        bool=0;
        
    end

return;

end

