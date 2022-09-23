%313211332251 513355452351 1131444215424445
%1242243444 4233535444 2532423132 335423215124 513355452351(34) 454354'41 13425251 4443 23115251 31321133225134 4443 113341 443251 335125 151113545134 124324 443251 114142113151333145 231144244235 
Mod_Enz = [1 Enz_score(1); 2 Enz_score(2);3 Enz_score(3); 4 Enz_score(4);5 Enz_score(5); 6 Enz_score(6);7 Enz_score(7); 8 Enz_score(8);9 Enz_score(9);10 Enz_score(10)];

N_Mod = length(Mod_Enz(:,1))
N_entryx = length(entryx)

reac_num = 0;
prod_num = 0;

Mod_Dia_Con= Dia_Con;

for i = 1:N_Mod
    for j = 1:rxi
        
        if isequal(Mod_Enz(i,1),reac_array(j,3)) == 1
           for k = 1:N_entryx
            if isequal(reac_array(j,1),entryx(k)) == 1
                reac_num = k
            
                for a = 1:N_entryx
                if isequal(reac_array(j,2),entryx(a)) == 1
                    prod_num = a 
                
                end
                end
                Mod_Dia_Con(reac_num,prod_num) = Mod_Enz(i,2)
            end
           end
        end
    end
end

disp("τὰ πάντα ῥεῖ καὶ οὐδὲν μένει")
