clear; clc; close all
load trainSet.mat
%%
% Non normalized data

xTrain = trainSet(:,1:end-1);
yTrain = trainSet(:,end);

reduced = pca(xTrain);
reducedxTrain = xTrain * reduced(:,1:3);
idx = trainSet(:,end) == 1;
first = reducedxTrain(:,1);
second = reducedxTrain(:,2);
third = reducedxTrain(:,3);

figure
scatter3(first(idx),second(idx),third(idx),'rx')
%plot(first(idx), second(idx), 'bx');
hold on
idx = yTrain == 0;
%plot(first(idx), second(idx), 'mx');
scatter3(first(idx),second(idx),third(idx),'bx')

%%
%Zero-mean Normalization

xTrain = trainSet(:,1:end-1);
yTrain = trainSet(:,end);
normalizationMean = mean(xTrain);
normalizationStd = std(xTrain); 
xTrain = (xTrain - repmat(normalizationMean, length(xTrain), 1))./repmat(normalizationStd, length(xTrain), 1);


reduced = pca(xTrain);
reducedxTrain = xTrain * reduced(:,1:3);
idx = trainSet(:,21) == 1;
first = reducedxTrain(:,1);
second = reducedxTrain(:,2);
third = reducedxTrain(:,3);

figure
scatter3(first(idx),second(idx),third(idx),'rx')
%plot(first(idx), second(idx), 'bx');
hold on
idx = trainSet(:,21) == 0;
%plot(first(idx), second(idx), 'mx');
scatter3(first(idx),second(idx),third(idx),'bx')

%%
%Min-max normalization

xTrain = trainSet(:,1:end-1);
yTrain = trainSet(:,end);
xTrain = (xTrain - repmat(min(xTrain), length(xTrain), 1)) ./ repmat(max(xTrain) - min(xTrain), length(xTrain),1);

reduced = pca(xTrain);
reducedxTrain = xTrain * reduced(:,1:3);
idx = trainSet(:,21) == 1;
first = reducedxTrain(:,1);
second = reducedxTrain(:,2);
third = reducedxTrain(:,3);

figure
scatter3(first(idx),second(idx),third(idx),'rx')
%plot(first(idx), second(idx), 'bx');
hold on
idx = trainSet(:,21) == 0;
%plot(first(idx), second(idx), 'mx');
scatter3(first(idx),second(idx),third(idx),'bx')
