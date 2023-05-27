load Net3_100;tic; [MDS,fMDS,nMDS]= ParGADS(E);toc
MDS1 = MDS(1,:);
nV = 200; fitMDS1 = FitPar(MDS1,E,nV);
[CoreSet,fitCore,nCore,flagCore,cost] = coreDS(MDS,20,MDS1,fitMDS1,sum(MDS1),E,nV)