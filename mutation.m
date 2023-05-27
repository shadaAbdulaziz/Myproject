function [p,fitp,np] = mutation(pP,fitpP,Covn,ConX,Card,E,nV)
% Mutation Procedure
newP = pP;
newfit = fitpP;
newnP = sum(newP);
if Covn < 1    
    Pzeros = find(newP == 0);
    nPzeros = length(Pzeros);     
    for j = 1:nPzeros
        newP(Pzeros(j)) = 1;        
        newfit = FitPar(newP,E,nV);        
        if Covn >= 1
            pP = newP;
            fitpP = newfit;
            newnP = newnP + 1;
        end
    end
elseif ConX < 1
    [newP,newnP,newfitp] = ConnectMDS(newP,newfit,newnP,E,nV);    
    if ConX >= 1
        pP = newP;
        fitpP = newfitp;
        newnP = newnP;
    end
else
    Pones = find(newP);
    nPones = length(Pones); 
    for i = 1:nPones        
        newP(Pones(i)) = 0;
        newfit = FitPar(newP,E,nV);         
        if Card >= 1
            pP = newP;
            fitpP = newfit;
            newnP = newnP - 1;
        end
    end
end
p = pP;
fitp = fitpP;
np = newnP;