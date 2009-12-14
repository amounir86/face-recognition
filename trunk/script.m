load video1
obs_name = input('Type your name: ','s');
fid = fopen('Labeling1.txt','w');
fprintf(fid,'video1.mat\n');
fprintf(fid,'Observer: %s\n',obs_name);
figure
for s=1:3
    fprintf(fid,'Session: %d\n',s);
    for i=1:length(seq)
        a=seq{i};
        imshow(a)
        key=32;
        while(key==32)
            [x y] = ginput(2);
            if (length(x)==2)
                person_name = input('Name: ','s');
                fprintf(fid,'%d [%d %d %d %d] %s\n', i, x(1), y(1), x(2)-x(1), y(2)-y(1), person_name);
                key=32;
            else
                key=0;
            end
        end
    end
end
fclose(fid);