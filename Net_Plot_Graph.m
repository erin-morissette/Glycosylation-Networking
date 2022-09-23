%Plot Signal Flow Graph Real
figure
Graph_Org = digraph(Dia_Con);
% Graph_Org.Nodes.Name = entryx_ID

p = plot(Graph_Org,'Layout','layered')
Grad_Org = (Dia_Con')*Org_Int
Div_Org = Dia_Con*Grad_Org
Laplacian = Dia_Con*(Dia_Con')
L_weight = Laplacian*Org_Int
L_max = max(L_weight)
Int_Max = max(Org_Int)

Graph_Org.Nodes.Size = L_weight;
% Graph_Org.Nodes.Name = {str_entryx_ID};
Graph_Org.Nodes

Graph_Org.Nodes.NodeColors = L_weight;
p.NodeCData = Graph_Org.Nodes.NodeColors;
colorbar
title('HMC3 Control (Laplacian)')
% 
% plot(Graph_Org,'Layout','force')

figure
p = plot(Graph_Org,'Layout','layered')
Grad_Org = (Dia_Con')*Org_Int
Div_Org = Dia_Con*Grad_Org
Laplacian = Dia_Con*(Dia_Con')
L_weight = Laplacian*Org_Int
L_max = max(L_weight)
Int_Max = max(Org_Int)

Graph_Org.Nodes.Size = Org_Int;
% Graph_Org.Nodes.Name = Real;


Graph_Org.Nodes.NodeColors = Org_Int;
p.NodeCData = Graph_Org.Nodes.NodeColors;
colorbar
title('HMC3 Control (Intensity)')