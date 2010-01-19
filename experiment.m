function [ confusionMatrizes ] = experiment(K)
%EXPERIMENT Summary of this function goes here
%   Detailed explanation goes here

% Load images (each row is an image) DONE BY LLUIS AND EKAIN
[faces, faceLabels] = imageOnMatrix();

faces=double(faces);
% Split data in Train and Test (CROSSVALIND)
indices = CROSSVALIND('Kfold',faceLabels,K);
confusionMatrizes= cell(K,1);
% TRAINING
for i=1:K
    %cp = classperf(faceLabels);
    test = (indices == i);
    train = ~test;
    %   Eigenfaces decomposition (eigenvectors num choice)
    eigenfaces = getEigenFaces(double(faces(train,:)'), length(train));
    
    %  Training Data projection
    projectedTrainingFaces = faces(train,:) * eigenfaces;
    
    %   Test data projection
    projectedTestFaces = faces(test,:) * eigenfaces;
    
    %   In the case of SVM, train the classifier
    
    %   Classification
    classes = KNNCLASSIFY(projectedTestFaces,projectedTrainingFaces,faceLabels(train),3);
    
    %   Evaluation performance (CLASSPERF)
    cp=classperf(faceLabels(test),classes);
    
    confusionMatrizes{i} = cp.CountingMatrix;
end





% TEST
%   Data projection


%

% Repeat experiment with different parameters and build ROC curve DONE BY
% TONI


end

