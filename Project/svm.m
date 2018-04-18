clear; close all; 


%%
CreateDataSets()
load testSet
load trainSet

xTrain = trainSet(:,1:end-1);
yTrain = trainSet(:,end);
xTest = testSet(:,1:end-1);
yTest = testSet(:,end);


normalizationMean = mean(xTrain);
normalizationStd = std(xTrain); 
xTrain = (xTrain - repmat(normalizationMean, length(xTrain),1))./repmat(normalizationStd, length(xTrain), 1);
xTest =  (xTest - repmat(normalizationMean, length(xTest), 1))./repmat(normalizationStd, length(xTest), 1);

SVMModel = fitcsvm(xTrain,yTrain, 'KernelFunction', 'rbf');

testLabel = predict(SVMModel, xTest);
trainLabel = predict(SVMModel, xTrain);
fprintf("%d/%d\n" , sum(testLabel == yTest)/length(testLabel)*100, sum(trainLabel == yTrain)/length(trainLabel)*100);


