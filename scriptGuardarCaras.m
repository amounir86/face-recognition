load video2
figure
fid = readFile('FDLabeled2.txt',1);
    for i=1:length(fid.data{1})
       Face = fid.data{1}(i);
       cara= seq{Face.framenum}(Face.y-(Face.w)/2:Face.y+(Face.w)/2, Face.x-(Face.h)/2:Face.x+(Face.h)/2,:);
       cara2 = imresize(cara,[100 100]);
       imwrite(cara2,['Faces2\Face' num2str(Face.framenum) Face.label '.jpg'], 'JPG');
         %       Face = FaceDetect('haarcascade_frontalface_alt2.xml',double(rgb2gray(seq{i})));
%         if(Face ~= -1)
%             for h=1:size(Face,1)
%                 imwrite(seq{i}(Face(h,2):Face(h,2)+Face(h,4),Face(h,1):Face(h,3)+Face(h,1),:),['Faces\Face' num2str(i) num2str(h) '.jpg'], 'JPG');
%                 %fprintf(fid,'%d [%d %d %d %d] %s\n', i, Face(h,1), Face(h,2), Face(h,3), Face(h,4), 'unknow');         
%             end
%         end
    end
