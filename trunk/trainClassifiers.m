function [classifiers] = trainClassifiers(trainingImages, imageLabels)
% trainClassifiers, This function trains the SVM classifiers using the one
% against all strategy and returns the result as a vector of trained
% classifiers.
%
% INPUT: originalImages, the images that we should train the system with.
%        imageLabels, the label of each image so that we can enforce the
%                     one against all classifier training.
%
% OUTPUT: classifiers, a vector of trained classifiers.

    % Choose the distinct labels.
    distinctLabels = unique(imageLabels);

    % Iterate on every distinct labels
    for i = 1:size(distinceLabels)

        % Initialize the classifier labels
        clLabels = imageLabels;

        % Choose the images that don't have this label
        clLabels(find(clLabels ~= distinctLabels(i))) = 'NONE';

        % Build the One-Against-All classifier
        classifiers(i) = svmtrain(trainingImages, clLabels);

    end

end

