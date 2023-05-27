function [X,fitX,flagLocal] = LocalSearch(X,fitX,nStep,domProb,E,nV)
% Local Search
Y = X;
flagLocal = 0;
for k = 1:nStep
    if fitX >= 0.7
        domProb = 1 - domProb;        
        domProb = domProb .* X;        
        domProb = domProb/sum(domProb);
        Sum=0;
        for j = 1:nV
            Sum = Sum + domProb(j);
            ProbSum(j) = Sum;
        end
        check = 0;
        NewIn = 1;
        rNo = rand;
        while check == 0 
            if rNo < ProbSum(NewIn)
                Y(NewIn) = 1 - Y(NewIn);
                check = 1;
            else
                NewIn = NewIn+1;
            end        
        end
        fitY = FitPar(Y,E,nV);
    else
        domProb = domProb .* (1-X);
        domProb = domProb/sum(domProb);
        Sum=0;
        for j = 1:nV
            Sum = Sum + domProb(j);            
            ProbSum(j) = Sum;
        end
        check = 0;
        NewIn = 1;
        rNo = rand;
        while check == 0 && NewIn < nV 
            if rNo < ProbSum(NewIn)
                Y(NewIn) = 1 - Y(NewIn);
                check = 1;
            else
                NewIn = NewIn+1;
            end        
        end
        fitY = FitPar(Y,E,nV);
    end
    if fitY > fitX
        X = Y;
        fitX = fitY;
        flagLocal = 1;
    end
end