function [ confusionMatrizes, fprate,tprate, KNNvalues ] = experiment_ROI(K,KNNvalues)
%EXPERIMENT_ROI Summary of this function goes here
%   Detailed explanation goes here

% Load images (each row is an image) DONE BY LLUIS AND EKAIN
[faces, faceLabels] = imageOnMatrix();

faces=double(faces);

% Split data in Train and Test (CROSSVALIND)
indices = CROSSVALIND('Kfold',faceLabels,K);
confusionMatrizes= cell(K,1);
fprate = zeros(K,10);
tprate = zeros(K,10);

% TRAINING
for i=1:K
    %cp = classperf(faceLabels);
    test = (indices == i);
    train = ~test;
    %   Eigenfaces decomposition (eigenvectors num choice)
    eigenfaces = getEigenFaces(double(faces(train,:)'), sum(train));
    
    %  Training Data projection
    projectedTrainingFaces = faces(train,:) * eigenfaces;
    
    %   Test data projection
    projectedTestFaces = faces(test,:) * eigenfaces;
    
    %   In the case of SVM, train the classifier
    
    %   Classification
    for K_KNN=1:length(KNNvalues)
        classes = KNNCLASSIFY(projectedTestFaces,projectedTrainingFaces,faceLabels(train),KNNvalues(K_KNN));
         %   Evaluation performance (CLASSPERF)
        cp=classperf(faceLabels(test),classes);
        fprate(i,K_KNN) = cp.Specificity;
        tprate(i,K_KNN) = cp.Sensitivity;
    end
    
%     confusionMatrizes{i} = cp.CountingMatrix;
    
end

figure
[Y, ind] = sort(mean(tprate));
X = mean(fprate);
X = X(ind);
KNNvalues = KNNvalues(ind);
plot(1-X,Y)
axis([0 1 0 1])

% TEST
%   Data projection


%

% Repeat experiment with different parameters and build ROC curve DONE BY
% TONI


end

