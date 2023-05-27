function [MDS_Final,fitMDS_Final,nMDS_Final] = ParGADS(E,nLabs)
% Parallel GA for MCDS
% Procedures: FitPar, GA_Operators, Local Search

% Initial Parameters
% nLabs = 20;      % No. of workers >= 4
P_Size = 40;
nV = size(E,1);
MDS = [];
fitMDS = [];

memeFactor = 1; % Memetic Factor for Applying the Local Search
nStep = 5;      % No. of Local Search Steps
CoreNo = P_Size/2;
domV = sum(E);  % No. of Domination Nodes by each Nodes
domProb = domV/sum(domV);

gNo = 1;        % Generation Counter
gNo_max = max(50,nV/2);   % Max No of Generation 
migrationInterval = 10;
migIndex = 0;

ter = 0;        % Termination Flag


% Starting Parallel Pool
delete(gcp('nocreate')) % To close any opened parpool
parpool(nLabs)          % To start new parpool with nLabs workers

% Initial Population Generation 
Local_P = Composite();
Local_fitP = Composite();

spmd
    % Sending Worker Populations to the Elite & Diverse Cores
    if labindex ~= 1 && labindex ~= nLabs
        Local_P = unidrnd(2,P_Size,nV)-1;
        Local_fitP = FitPar(Local_P,E,nV);
        labSend(Local_P,1,1);
        labSend(Local_fitP,1,2);
        labSend(Local_P,nLabs,11);
        labSend(Local_fitP,nLabs,12);
    end   
    % Receiving Worker Populations and Choose the Elite Population
    % Sending the Elite Population to the Diverse Core
    if labindex == 1
        P_Pool = [];
        fit_Pool = [];
        for j = 2:nLabs-1
            Local_P_Rec = labReceive(j,1);
            Local_fitP_Rec = labReceive(j,2);
            P_Pool = [P_Pool; Local_P_Rec];
            fit_Pool = [fit_Pool; Local_fitP_Rec];            
        end        
        [fit_Pool_Sort,i_Sort] = sort(fit_Pool,'descend');
        P_Pool_Sort = P_Pool(i_Sort,:);
        Local_P = P_Pool_Sort(1:P_Size,:);
        Local_fitP = fit_Pool_Sort(1:P_Size);
        labSend(Local_P,nLabs,21);        
        MDS = Local_P(1,:);
        fitMDS = Local_fitP(1);
        nMDS = sum(MDS);
        sumBest = sum(Local_P);
    end
    % Receiving Worker Populations and Choose the Divrse Population
    if labindex == nLabs
        P_Pool2 = [];
        fit_Pool2 = [];
        for j = 2:nLabs-1
            Local_P2_Rec = labReceive(j,11);
            Local_fitP2_Rec = labReceive(j,12);
            P_Pool2 = [P_Pool2; Local_P2_Rec];
            fit_Pool2 = [fit_Pool2; Local_fitP2_Rec];            
        end
        Best_Rec = labReceive(1,21);
        Pool2_size = size(P_Pool2,1);
        DiverseDist = nV*ones(Pool2_size,1);
        for j = 1:Pool2_size            
            for k = 1:P_Size
                HammingDist = sum(xor(P_Pool2(j,:),Best_Rec(k,:)));
                if HammingDist < DiverseDist(j)
                    DiverseDist(j) = HammingDist;
                end
            end
        end
        [~,iDiverse_Sort] = sort(DiverseDist,'descend');  
        P_Pool2_Sort = P_Pool2(iDiverse_Sort,:);
        fit_Pool2_Sort = fit_Pool2(iDiverse_Sort);
        Local_P = P_Pool2_Sort(1:P_Size,:);
        Local_fitP = fit_Pool2_Sort(1:P_Size);
    end        
end

% Main Loop
while ter == 0
    Local_Offspring = Composite();     
    Local_fitOffspring = Composite();
    spmd 
        [Local_Offspring,Local_fitOffspring] = ...
            GA_Operators(Local_P,Local_fitP,P_Size,E,nV);        
        if memeFactor == 1
            for i = 1:P_Size
                [Local_Offspring(i,:),Local_fitOffspring(i),flagLocal] = ...
                    LocalSearch(Local_Offspring(i,:),Local_fitOffspring(i),nStep,domProb,E,nV);
            end
        end
        % Migration Process
        if migIndex >= migrationInterval
            % Sending Solution to Elite Core
            if labindex ~= 1 && labindex ~= nLabs           
                labSend(Local_Offspring,1,3);
                labSend(Local_fitOffspring,1,4);
                labSend(Local_Offspring,nLabs,13);
                labSend(Local_fitOffspring,nLabs,14);
            end 
            if labindex == nLabs           
                labSend(Local_Offspring,1,3);
                labSend(Local_fitOffspring,1,4);               
            end 
            if labindex == 1
                Offspring_Pool = [];
                fitOffspring_Pool = [];
                for j = 2:nLabs
                    Offspring_Rec = labReceive(j,3);
                    fitOffspring_Rec = labReceive(j,4);
                    Offspring_Pool = [Offspring_Pool; Offspring_Rec];
                    fitOffspring_Pool = [fitOffspring_Pool; fitOffspring_Rec];                
                end        
                [fit_Pool_Sort,i_Sort] = sort(fitOffspring_Pool,'descend');
                Offspring_Pool_Sort = Offspring_Pool(i_Sort,:);
                Local_Offspring = Offspring_Pool_Sort(1:P_Size,:);
                Local_fitOffspring = fit_Pool_Sort(1:P_Size);
                labSend(Local_Offspring,nLabs,22);
            end 
            if labindex == nLabs 
                P_Pool2 = [];
                fit_Pool2 = [];
                for j = 2:nLabs-1
                    Local_P2_Rec = labReceive(j,13);
                    Local_fitP2_Rec = labReceive(j,14);
                    P_Pool2 = [P_Pool2; Local_P2_Rec];
                    fit_Pool2 = [fit_Pool2; Local_fitP2_Rec];            
                end
                Best_Rec = labReceive(1,22);
                Pool2_size = size(P_Pool2,1);
                DiverseDist = nV*ones(Pool2_size,1);
                for j = 1:Pool2_size            
                    for k = 1:P_Size
                        HammingDist = sum(xor(P_Pool2(j,:),Best_Rec(k,:)));
                        if HammingDist < DiverseDist(j)
                            DiverseDist(j) = HammingDist;
                        end
                    end
                end
                [~,iDiverse_Sort] = sort(DiverseDist,'descend');  
                P_Pool2_Sort = P_Pool2(iDiverse_Sort,:);
                fit_Pool2_Sort = fit_Pool2(iDiverse_Sort);
                Local_P = P_Pool2_Sort(1:P_Size,:);
                Local_fitP = fit_Pool2_Sort(1:P_Size);
            end 
            migIndex = 0;            
        end
        % Best Solution Update & Improve
        if labindex == 1
            if Local_fitP(1) > fitMDS
                MDS = Local_P(1,:);
                fitMDS = Local_fitP(1);
                nMDS = sum(MDS);
                [~,~,Coverness,~,~] = FitPar(MDS,E,nV);
                if Coverness >= 1
                    [MDS,fitMDS] = filtering(MDS,fitMDS,E,nV);
                end
                [newMDS,~,newfitMDS] = ...
                    ConnectingDS(MDS,fitMDS,nMDS,E,nV);
                if newfitMDS > fitMDS
                    MDS = newMDS;
                    fitMDS = newfitMDS; 
                    nMDS = sum(MDS);
                end                    
            end
            sumBest = sumBest + sum(Local_P);
        end
        New_Pool = [Local_P; Local_Offspring];
        New_fitPool = [Local_fitP; Local_fitOffspring];
        [New_fitPool_Sort,i_Sort] = sort(New_fitPool,'descend');
        New_Pool_Sort = New_Pool(i_Sort,:);
        Local_P = New_Pool_Sort(1:P_Size,:);
        Local_fitP = New_fitPool_Sort(1:P_Size);
        if labindex == 1
            DataDisplay = [' At Generation: ',num2str(gNo), ' - Optimal so far: ',num2str(nMDS)];
            disp(DataDisplay)            
        end
        migIndex = migIndex + 1;
    end
    
    global_P = Local_P;       
    
    gNo = gNo + 1;
    
    if gNo > gNo_max
        ter = 1;
    end     
end
% Final Intensification
DS = global_P{1};

[CoreSet,fitCore,nCore,~,~] = coreDS(DS,CoreNo,MDS{1},fitMDS{1},nMDS{1},E,nV);
if fitCore > fitMDS{1}
    MDS{1} = CoreSet;
    fitMDS{1} = fitCore;
    nMDS{1} = nCore;
end
% Final Intensification 2
[~,iBest_sort] = sort(sumBest{1},'descend');
newTrial = zeros(1,nV);
newSize = nMDS{1}-1;
for i = 1:newSize
    newTrial(iBest_sort(i)) = 1;
    newTrial_fit = FitPar(newTrial,E,nV);         
    if newTrial_fit > fitMDS{1}
        MDS{1} = newTrial;
        fitMDS{1} = newTrial_fit;
        nMDS{1} = sum(newTrial);
    end
end

nMDS_Final = nMDS{1};
fitMDS_Final = fitMDS{1};
MDS_Final = MDS{1};
DataDisplay = ['Final Optimal: ',num2str(nMDS_Final)];
disp(DataDisplay)  
DataDisplay = ['Final Fitness: ',num2str(fitMDS_Final)];
disp(DataDisplay)

end




