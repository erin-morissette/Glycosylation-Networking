% Calculate Relative Enzyme Activity
Path = [];
Enz_score = zeros(length(enz_names),1);
for i = 1:length(entryx)

    %Don't forget init
Path = shortestpath(Graph_Org,60,entryx(i));

    for j = 1:length(Path)
        for k = 1:length(reac_array) 
            if isequal(Path(:,j),reac_array(k,2)) == 1
               Enz_score(reac_array(k,3)) = Enz_score(reac_array(k,3)) + (Org_Int(i)./(max(Org_Int)))*10;
            end
        end
    end
end


Rel_Enz_Activity = [string(enz_names.list),Enz_score]

bar(categorical(string(enz_names.list)),Enz_score,'blue')
title('Relative Enzyme Activity (TIB-190 Control)')
xlabel('Enzyme')
ylabel('Relative Enzyme Activity')