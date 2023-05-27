function [newMDS,newnMDS,newfitMDS] = ConnectingDS(MDS,fitMDS,nMDS,E,nV)
newMDS = MDS;
newnMDS = nMDS;
newfitMDS = fitMDS;

Conflag = 0;
m = nV - nMDS;
nL = 0;
if m ~= 0
    [L,nL,~,n_max] = Comp(MDS,E);
end
if nL > 1
    index = 0;
    maxCom = [];
    rCom = [];
    for i = 1:nV
        if MDS(i) == 1
            index = index + 1;
            bigL(i) = L(index); 
            if bigL(i) == n_max
                maxCom = [maxCom i];
            else
                rCom = [rCom i];
            end
        else
            bigL(i) = 0;        
        end
    end
    maxCom_size = length(maxCom);
    rCom_size = length(rCom);

    rand_1 = randi(maxCom_size);  % from one rand node to one rand node
    rand_2 = randi(rCom_size);
    r_1 = maxCom(rand_1);
    r_2 = rCom(rand_2);
    if Conflag == 0
        SG = sparse(E);
        UG = tril(SG + SG');
        [~,path,~] = graphshortestpath(UG,r_1,r_2);
        Conflag = 1;
    end  

    nP = length(path);
    if Conflag == 1
        for j = 2:nP-1
            newMDS(path(j)) = 1;                                                      
        end
        newnMDS = sum(newMDS);
        newfitMDS = FitPar(newMDS,E,nV);
        Conflag = 0;
    end       
end

function [L,nL,maxComp,n_max] = Comp(X,E)
% Connectivity Evaluation Procedure
nX = sum(X);
OneX = find(X==1);
L = [];         % Components of graph
L(1) = 1;
current_comp = 1;  % Components counter
for i = 2:nX
    comp_flag = 0;
    for j = 1:i-1
        if E(OneX(i),OneX(j)) == 1
            L(i) = L(j);
            comp_flag = 1;
            break
        end
    end    
    if comp_flag == 0 
        current_comp = current_comp + 1;
        L(i) = current_comp;
    end
end
nL = current_comp; % Component No
comp_Size = zeros(nL,1);
for k = 1:nL
    for i = 1:nX
        if L(i) == k
            comp_Size(k) = comp_Size(k) + 1 ;
        end
    end
end
[maxComp,n_max] = max(comp_Size);
