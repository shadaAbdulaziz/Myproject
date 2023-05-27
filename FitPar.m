function [fP,CP,CovnP,ConnP,CardP] = FitPar(P,E,nV)
cardBest = nV;
nSol = size(P,1);

fP = zeros(nSol,1);
CP = zeros(nSol,nV);
CovnP = zeros(nSol,1);
ConnP = zeros(nSol,1);
CardP = zeros(nSol,1);
% Fitness Function Evaluation Procedure
for i = 1:nSol
    x = P(i,:);
    nNodes = sum(x); % No of Dominating Verties by x + No. of Verties in x
    xV = find(x==1); % Including Vertices in x
    non_xV = find(x==0);
    Cx = x; % Vertices in x and Vertices in V are dominated by a node in x
    No_non_xV = nV - nNodes; % No of Verties not including in x
    for j = 1:No_non_xV
        if x(non_xV(j)) == 0
            Connect_Check = 0;        
            counter_x = 1;
            while Connect_Check == 0 && counter_x <= sum(x)
                if E(non_xV(j),xV(counter_x)) == 1
                    Connect_Check = 1;                
                end
                counter_x = counter_x + 1;            
            end    
            if  Connect_Check == 1
                nNodes = nNodes + 1;
                Cx(non_xV(j)) = 1;
            end   
        end
    end
    if nNodes ~= 0
        n_x = sum(x);
        [~,~,maxComp,~] = Comp(x,E);
        if n_x > cardBest
            fract = 0.25;
        elseif n_x == cardBest
            fract = 0.5;
        else
            fract = 1;
            cardBest = n_x;
        end
        ConX = maxComp/n_x; 
        Covn = nNodes/nV;
        Card = (nV-n_x)/nV;
        if ConX == 1 && Covn == 1
            coff = 1;
        else
            coff = 0;
        end    
        fx = 0.4*Covn + 0.3*ConX + 0.3*coff*(Card);
        % fx = (nNodes+ 1/n_x)/nV + wcon*((nL + n_x)-1)/n_x; 
        % fx = 0.4*Covn + 0.3*ConX + 0.3*Card;
    else
        fx = 0;
        ConX = 0;
        Covn = 0;
        Card = 0;
    end
    fP(i) = fx;
    CP(i,:) = Cx;
    CovnP(i) = Covn;
    ConnP(i) = ConX;
    CardP(i) = Card;
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
