function [eigen_faces] = getEigenFaces(original_faces, evecs_count)
% - This method calculates the eigen faces of an image given a list of
% original faces represented as a matrix.
%
% - I don't know yet what it should return. I'll updated this when I finish

  % Get top 30 PC evectors of Imgs
  [Vecs, Vals, Psi] = pc_evectors(original_faces, evecs_count);

  plot(Vals); % To plot the eigenvalues
  CVals = zeros(1,length(Vals)); % Allocate a vector same length as Vals
  CVals(1) = Vals(1);

  for i = 2:length(Vals) % Accumulate the eigenvalue sum
    CVals(i) = CVals(i-1) + Vals(i);
  end;

  CVals = CVals / sum(Vals); % Normalize total sum to 1.0
  plot(CVals); % Plot the cumulative sum
  ylim([0 1]); % Set Y-axis limits to be 0-1
  
  num_evecs = input('Number of eigenvectors? ');

  eigen_faces = Vecs(:,1:num_evecs);
%   save eigenfaces.mat Vecs;

end

