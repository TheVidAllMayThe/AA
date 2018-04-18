
clear; close all; 

load('voice.csv')
xVoice = voice(:,1:(end-1));

correlation = abs(corrcoef(xVoice));
correlation = tril(correlation - diag(diag(correlation)));
correlated = correlation;
correlated(correlated<0.95) = 0;
[rows, cols] = find(correlated);
correlationSum = sum(correlation);

idx = [];
for i = 1:length(rows)
    if(correlationSum(rows(i)) < correlationSum(cols(i)))
        idx = [idx cols(i)];
    else
        idx = [idx cols(i)];
    end
end
xVoice(:,idx) = [];
voice = [xVoice voice(:,end)];

%%
%Create random test and training sets (for validation uncomment)
voiceMale = voice(1:end/2,:);
voiceFemale = voice(end/2+1:end,:);
idx = randperm(length(voiceMale));

voiceMaleTrain = voiceMale(idx(1:round(end*0.8)),:);
voiceFemaleTrain = voiceFemale(idx(1:round(end*0.8)),:);
%voiceMaleValidation = voiceMale(idx(round(end*0.6)+1:round(end*0.8)),:);
%voiceFemaleValidation = voiceMale(idx(round(end*0.6)+1:round(end*0.8)),:);
voiceMaleTest =  voiceMale(idx(round(end*0.8)+1:end),:);
voiceFemaleTest =  voiceFemale(idx(round(end*0.8)+1:end),:);

testSet = [voiceMaleTest; voiceFemaleTest];
%validationSet = [voiceMaleValidation; voiceMaleValidation];
trainSet = [voiceMaleTrain; voiceFemaleTrain];


save('testSet', 'testSet');
save('trainSet', 'trainSet');
%save('validationSet', 'validationSet');

clear; close all;