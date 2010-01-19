function [class] = svmOAA(SVMs, labels, newData)
%SVMOAA Multiclass One-against-all SVM classifier
%   - SVMs: vector with all classifiers
%   - labels: vector of the same size as SMVs, indicating the label of the
%   class which each classifier is specialized
%   - newData: data point to be classified

fVals = zeros(size(SVMs));

% Compute the distance from the new data point to the boundary of each
% classifier
for i=1:length(SVMs)
    [out, fVals(i)] = abs(svmdecision((newData + SVMs(i).ScaleData.shift).*SVMs(i).ScaleData.scaleFactor,SMVs(i)));
end

% Find the classifier which gives the highest output
[maxVal, indMax] = max(fVals);

% Classify the data with found classifier (winner-takes-all)
class = svmclassify(SVMs(indMax),newData);

end

