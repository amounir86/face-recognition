labeling = readFile('Labeling1.txt');

fid = fopen('statistics.txt','w');
fprintf(fid,'%s\n',labeling.videoname);
fprintf(fid,'%s\n',labeling.expertname);

fprintf(fid,'Labeled faces at each session: \n');

for i=1:3
   fprintf(fid,'Session: %d ',i);
   fprintf(fid,'Faces: %d\n',length(labeling.data{i}));   
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