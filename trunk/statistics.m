function a=statistics(inputFile,outputFile)
% labeling = readFile('ANNOTATION_VIDEO2_MAX.txt');
labeling = readFile(inputFile);

% fid = fopen('statistics2.txt','w');
fid = fopen(outputFile,'w');
fprintf(fid,'%s\n',labeling.videoname);
fprintf(fid,'%s\n',labeling.expertname);

fprintf(fid,'Labeled faces at each session: \n');

X=[];
for i=1:3
   fprintf(fid,'Session: %d ',i);
   fprintf(fid,'Faces: %d\n',length(labeling.data{i}));
   X(i)=length(labeling.data{i});
   a = unique({labeling.data{i}.label});
   %fprintf(fid,'Characters: %d ',length(a));
   for j=1:length(a)
     n = strmatch(a{j},{labeling.data{i}.label},'exact');
     fprintf(fid,'%s: %d\n',a{j},length(n));
   end
   fprintf(fid,'Mean size of the face squares: ');
   a=sum([labeling.data{i}.w])/length(labeling.data{i});
   fprintf(fid,'%d\n',a);
   
end
a=std(X);

fclose(fid)