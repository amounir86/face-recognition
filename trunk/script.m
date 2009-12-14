load video2
obs_name = input('Type your name: ','s');
fid = fopen('Labeling2-3.txt','w');
fprintf(fid,'video2.mat\n');
fprintf(fid,'Observer: %s\n',obs_name);
figure
fprintf(fid,'Session: %d\n',1);
for i=1:length(seq)
    fprintf (1, 'Frame %d of 200\n', i);
    a=seq{i};
    imshow(a)
    key=32;
    while(key==32)
        [x y] = ginput(2);
        if (length(x)==2)
            person_name = input('Name: ','s');
            fprintf(fid,'%d [%d %d %d %d] %s\n', i, min(x(1), x(2)), min(y(1), y(2)), abs(x(2)-x(1)), abs(y(2)-y(1)), person_name);
            key=32;
        else
            key=0;
        end
    end
end
fclose(fid);
