function bool = INVALID_NAME( Name )
global MAX_NAME_LENGTH;
l=length(Name);
if ~isempty(Name)&& l< MAX_NAME_LENGTH +1
    bool=0;
else
    bool=1;
end
return;
end

