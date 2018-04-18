load testSet
load trainSet

xTrain = trainSet(:,1:end-1);
yTrain = trainSet(:,end);
xTest = testSet(:,1:end-1);
yTest = testSet(:,end);


coef = mnrfit(xTrain, yTrain);