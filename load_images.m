function [Images,w,h] = load_images(parentFolder, extensionList)
% LOAD_IMAGES Load a set of images as a column vector
%
%    INPUT: parentFolder, The folder that contains the image files.
%                         e.g. '.' means the current folder.
%           extensionList, The images extensions that we want to load
%                         e.g. '*.jpg' will load all of the jpg files
%
%    OUTPUT: Images, a column vector containing every image in the folder.
%            w, width of the images (Should be the same for all images)
%            h, height of the images (Should be the same for all images)
  
  % Load the list of files.
  filelist = file_list(parentFolder, extensionList);

  % Initialize the values
  Images = [];
  w=0;
  h=0;
  numimgs = length(filelist);

  % For every image, read it and store it in the return array
  for i = 1:numimgs
      
    imgname = char(filelist(i));
    fprintf(1,'Reading Image File %s\n',imgname);
    Img = imread(imgname);
    Img = rgb2gray(Img);

    if i==1 % If this is first image, allocate w and h and Images ret array
      w = size(Img,2);        
      h = size(Img,1);
      Images = zeros(w*h, numimgs);
    end;

    Images(1:w*h, i) = reshape(Img', w*h, 1); % Make a column vector

  end;

  fprintf(1,'Read %d images.\n',numimgs);

end % End function
