load video1
obs_name = 'Face detector';
fid = fopen('Labeling1-Facedetect.txt','w');
fprintf(fid,'video1.mat\n');
fprintf(fid,'Observer: %s\n',obs_name);
figure
for j=1:3
fprintf(fid,'Session: %d\n',j);
    for i=1:length(seq)
        %fprintf (1, 'Frame %d of 200\n', i);
        %a=seq{i};
        %imshow(a)
        %key=32;
%         while(key==32)
%             [x y] = ginput(2);
%             if (length(x)==2)
%                 person_name = input('Name: ','s');
%                 fprintf(fid,'%d [%d %d %d %d] %s\n', i, min(x(1), x(2)), min(y(1), y(2)), abs(x(2)-x(1)), abs(y(2)-y(1)), person_name);
%                 key=32;
%             else
%                 key=0;
%             end
%         end

        Face = FaceDetect('haarcascade_frontalface_alt2.xml',double(rgb2gray(seq{i})));
        if(Face ~= -1)
            for h=1:size(Face,1)
                fprintf(fid,'%d [%d %d %d %d] %s\n', i, Face(h,1), Face(h,2), Face(h,3), Face(h,4), 'unknow');         
            end
        end
    end
end
fclose(fid);