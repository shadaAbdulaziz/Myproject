function [c1,c2] = xover(p1,p2,nV)
% Crossover Procedure
cut = unidrnd(nV-1,1,1);
c1 = p1; c2 = p2;
for j = cut:nV
    c1(j) = p2(j);
    c2(j) = p1 (j);
end