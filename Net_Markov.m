% Make a Markov Simulation 
P = Mod_Dia_Con;
mc = dtmc(P);
mc.StateNames = entryx_ID
figure;

G = digraph(mc.P)
p = plot(G,'Layout','layered')
G.Edges.EdgeColors = G.Edges.Weight;
p.EdgeCData = G.Edges.EdgeColors;
colorbar

p.NodeLabel = entryx_ID
p.NodeFontSize = 5

figure
First_Sim_Graph = graphplot(mc,'ColorEdges',true);
First_Sim_Graph.MarkerSize = 2
First_Sim_Graph.NodeColor = [0 0 1]

steps = 19

x0 = zeros(1,248)
%init
x0(60) = 10; 
X = simulate(mc,steps,'X0',x0);

% figure
% simplot(mc,X,'Type','Graph','FrameRate',1)

figure
Sim_Object = simplot(mc,X)

Shannon = wentropy((mc.P),'shannon') 

Shan_Step = {};

for i = 2:length(X(:,1))
    for j = 1:length(X(1,:))
        for k = 1:length(entryx)
            if isequal(X(i,j),entryx(k)) == 1
                Shan_Step{i,j} = mc.P(:,k)
            end
        end
    end
end

Entropy_Step = [];
Step = {};
Step_Mat = {};

for i = 1:length(X(:,1))
    Step{i} = Shan_Step{i,:}

     Step_Mat{i} = horzcat(Step{:})
 Entropy_Step(i) = wentropy(Step_Mat{i},'shannon') 
end

figure
bar(categorical(0:steps),Entropy_Step)
fprintf('Shannon Entropy is %f \r\n',Shannon);

