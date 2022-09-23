% Grab Real Data
%Import IDs under Real_Struc 
%Import the intensity or relative abundance under Real_Int

N_Real = length(Real_Int);
Org_Int = zeros(ngi,1);
N_occ = zeros(1,1);
N_entryx_ID = length(entryx_ID);
str_entryx_ID = strings(N_entryx_ID,1);
Str_count = 0;


for i = 1:N_entryx_ID 
    str_entryx_ID(i) = num2str(entryx_ID(i));
end 

Join_ID = strjoin(str_entryx_ID);

for i = 1:ngi
    Str_count = count(Join_ID,str_entryx_ID(i))
    for j = 1:N_Real 
    if strcmp(Real_Struc(j),str_entryx_ID(i)) == 1 && isequal(Str_count,1) == 1 
        Org_Int(i) = Real_Int(j)
    elseif strcmp(Real_Struc(j),str_entryx_ID(i)) == 1  && Str_count > 1 == 1 
        for k = 1:ngi
            if strcmp(str_entryx_ID(i),str_entryx_ID(k))
               N_occ = count(Join_ID,str_entryx_ID(i));
               Org_Int(i)= Real_Int(j)/N_occ
            end
        end
    end
    end
end

for i = 1:ngi
    if Org_Int(i) == 0
        Org_Int(i) = .001
    end
end



