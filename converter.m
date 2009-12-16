function converter(inputFile, outputFile)
% labeling = readFile('Labeling1.txt');
labeling = readFile(inputFile);

% fid = fopen('ANNOTATION_VIDEO1_MAX.txt','w');
fid = fopen(outputFile,'w');
fprintf(fid,'%s\n',labeling.videoname);
fprintf(fid,'%s\n',labeling.expertname);

for i=1:3
    
    fprintf(fid,'Session: %d\n',i);
    
    for j=1:length(labeling.data{i})
    
        fprintf(fid,'%d ',labeling.data{i}(j).framenum);
        x = labeling.data{i}(j).x;
        y = labeling.data{i}(j).y;
        w = labeling.data{i}(j).w;
        h = labeling.data{i}(j).h;
        
        med = max(h,w);
        %med = (h+w)/2;
        cenx = x+w/2;
        ceny = y+h/2;
        
        fprintf(fid,'[%d %d %d %d] ', cenx, ceny, med, med);
        fprintf(fid,'%s\n ',labeling.data{i}(j).label);
        
        clear x y w h med cenx ceny;
        
    end
end
fclose(fid);
