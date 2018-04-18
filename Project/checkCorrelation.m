clear; clc; close all
load trainSet.mat
%%
% Non normalized data

xTrain = trainSet(:,1:end-1);
yTrain = trainSet(:,end);


correlation = abs(corrcoef(xTrain));
correlation = correlation - diag(diag(correlation));

correlated = correlation;
correlated(correlated<0.95) = 0;
[rown, columns] = find(correlated);

