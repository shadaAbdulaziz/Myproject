function [CoreSet,fitCore,nCore,flagCore,cost] = coreDS(DS,CoreNo,MDS,fitMDS,nMDS,E,nV)
% Final intensification
[n,m]= size(DS);
cost = 0;
if CoreNo > n
    CoreNo = n;
end
fitLimit = 0.7;
CoreSet = DS(1,:);
for j = 2:CoreNo
    CoreSet = CoreSet & DS(j,:);
end
nCore = sum(CoreSet);
if nCore >= nMDS - 1 
    CoreSet = MDS;
    fitCore = fitMDS;
    nCore = nMDS;
    flagCore = -1;
else
    fitCore = FitPar(CoreSet,E,nV);
    cost = cost + 1;
    if fitCore >= fitLimit        
        flagCore = 1;
        Sones =  find(CoreSet);
        nOnes = length(Sones); 
        for j =  1:nOnes
            newDS = CoreSet;
            newDS(Sones(j)) = 0;
            newfit = FitPar(newDS,E,nV);            
            cost = cost + 1;
            if newfit >= fitLimit
                CoreSet = newDS;
                fitCore = newfit;
                nCore = nCore - 1;                                
            end
        end
    else
        flagCore = 0;
        for k = nCore:nMDS - 1              
            SZeros =  find(CoreSet == 0);
            nZeros = length(SZeros);
            for j =  1:nZeros
                newDS(j,:) = CoreSet;
                newDS(j,SZeros(j)) = 1;
                newfit(j) = FitPar(newDS(j,:),E,nV);            
                cost = cost + 1;                
            end
            [newmax,imax] = max(newfit);
            CoreSet = newDS(imax,:);
            fitCore = newmax;
            nCore = sum(CoreSet); 
            if newmax >= fitLimit                 
                flagCore = 1;
                break
            end            
        end
        if flagCore == 0
            CoreSet = MDS;
            fitCore = fitMDS;
            nCore = nMDS;
        end
    end        
end