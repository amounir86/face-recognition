function [ imgMatrix, labeledArray ] = imageOnMatrix()
%IMAGEONMATRIX Summary of this function goes here
%   Detailed explanation goes here
imgnames = file_list('Faces','jpg');
imgnames2 = file_list('Faces2','jpg');
imgvector = [];
labeledArray = cell(length(imgnames)+length(imgnames2),1);
for i = 1 : length(imgnames) 

    name = imgnames{i};
    if(strfind(name,'ross'))
        labeledArray{i} = 'ross';
    elseif (strfind(name,'fibi'))
        labeledArray{i} = 'phoebe';
    elseif (strfind(name, 'monica'))
        labeledArray{i} = 'monica';
    elseif (strfind(name, 'rachel'))
        labeledArray{i} = 'rachel';
    elseif (strfind(name, 'joey'))
        labeledArray{i} = 'joey';
    elseif (strfind(name, 'chedler'))
        labeledArray{i} = 'chandler';
    else
        labeledArray{i} = 'unknown';
    end
    image = imread(name);
    image=rgb2gray(image);
    imgvector = reshape(image,1,prod(size(image)));
    imgMatrix(i,:) = imgvector;

end
a = size(imgMatrix,1);    
for i = 1 : length(imgnames2) 

    name = imgnames2{i};
    if(strfind(name, 'Ross'))
        labeledArray{a+i} = 'ross';
    elseif (strfind(name, 'Phoebe'))
        labeledArray{a+i} = 'phoebe';
    elseif (strfind(name, 'Monica'))
        labeledArray{a+i} = 'monica';
    elseif (strfind(name, 'Rachel'))
        labeledArray{a+i} = 'rachel';
    elseif (strfind(name, 'Joey'))
        labeledArray{a+i} = 'joey';
    elseif (strfind(name, 'Chandler'))
        labeledArray{a+i} = 'chandler';
    else
        labeledArray{a+i} = 'unknown';
    end
    image = imread(name);
    image=rgb2gray(image);
    imgvector = reshape(image,1,prod(size(image)));
    imgMatrix(a+i,:) = imgvector;

end



