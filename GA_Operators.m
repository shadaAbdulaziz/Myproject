function [Offspring,fitOffspring,costOffspring] = GA_Operators(P,fitP,P_Size,E,nV)

pc = 0.8;    % Crossover Prob
pm = 0.05;   % Muatation Prob

EtaMax = 1.1;   % Slection parameters
EtaMin = 0.9;

cost = 0;
% Selection
J = 1:P_Size;
Prob = ( EtaMax - (EtaMax-EtaMin) * (J-1) / (P_Size - 1) ) / P_Size;
Sum = 0;
for j = 1:P_Size
    Sum = Sum + Prob(j);
    ProbSum(j) = Sum;
end

pP = zeros(P_Size,nV);
fitpP = zeros(P_Size,1);
RandNums = sort(rand(P_Size,1));    

NewIn = 1; % Random Numbers counter
ChrNo = 1; % Chromosom counter
while NewIn < P_Size       
    if RandNums(NewIn) < ProbSum(ChrNo)
        pP(NewIn,:) = P(ChrNo,:);
        fitpP(NewIn) = fitP(ChrNo);            
        NewIn = NewIn+1;
    else
        ChrNo = ChrNo + 1;
    end
end   

% Crossover
RandNumsC = rand(P_Size,1);
xover_members = [];
xoverIn = 0;
for j = 1:P_Size
    if RandNumsC(j) <= pc
        xoverIn = xoverIn + 1;
        xover_members(xoverIn) = j;            
    end
end    
xover_j = randperm(xoverIn);
for j = 1:2:2*floor(xoverIn/2)
    pNo1 = xover_members(xover_j(j));
    pNo2 = xover_members(xover_j(j+1));        
    [c1,c2] = xover(pP(pNo1,:),pP(pNo2,:),nV);
    pP(pNo1,:) = c1;
    pP(pNo2,:) = c2;
    fitpP(pNo1) = FitPar(pP(pNo1,:),E,nV);
    fitpP(pNo2) = FitPar(pP(pNo2,:),E,nV);
    cost = cost + 2;               
end     

% Mutation
RandNumsM = rand(P_Size,1);
for i = 1:P_Size
    if RandNumsM(i) <= pm
        [~,~,Covn,ConX,Card] = FitPar(pP(i,:),E,nV);
        if ConX == 1 && Covn == 1
            [pP(i,:),fitpP(i),~] = mutation(pP(i,:),fitpP(i),Covn,ConX,Card,E,nV);                
        else
            RandNumsM = rand(P_Size*nV,1);
            for j = 1:nV
                k = (i-1)*nV + j;
                if RandNumsM(k) <= pm
                    pP(i,j) = max(0,1-pP(i,j));
                    fitpP(i) = FitPar(pP(i,:),E,nV); 
                end
            end
            cost = cost + 1;
        end
    end
end    

[fitpPs,is] = sort(fitpP,'descend');
fitpP = fitpPs;
pPtmp = pP(is,:); pP = pPtmp;
if fitP(1) > fitpP(1)
    pP(P_Size,:) = P(1,:);
    fitpP(P_Size) = fitP(1);
    [fitpPs,is] = sort(fitpP,'descend');
    fitpP = fitpPs;
    pPtmp = pP(is,:); pP = pPtmp;
end
% Outputs
Offspring = pP; fitOffspring = fitpP; costOffspring = cost;



