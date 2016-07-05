function [ b,c ] = Is_In_Waiting_Blackboard_Set( a,d )
global Waiting_Blackboard_Set;
b=0;
c=0;
for i=d:256
    if ~isempty(Waiting_Blackboard_Set{1,i})&&Waiting_Blackboard_Set{1,i}.BLACKBOARD_ID==a.ID
        b=1;
        c=Waiting_Blackboard_Set{1,i}.ID;
        break;
    end
    d=d+1;
end


end

