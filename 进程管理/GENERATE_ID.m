function [ ID ] = GENERATE_ID()

     id = round( 1+(65535) *rand(1,1) );

    while INVALID_ID(id) == 1
        id = round( 1+(65535) *rand(1,1) );
    end
    
    ID = id;
    

end
