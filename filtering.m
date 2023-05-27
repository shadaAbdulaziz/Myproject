function [MDS,fitMDS] = filtering(MDS,fitMDS,E,nV)
DSones = find(MDS);
nOnes = length(DSones); 
for j =  1:nOnes
    newDS = MDS;
    newDS(DSones(j)) = 0;
    newfit = FitPar(newDS,E,nV);                
    if newfit > fitMDS
        MDS = newDS;
        fitMDS = newfit;     
    end
end