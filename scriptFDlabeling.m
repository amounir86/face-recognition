%INTERVARIABILITY Computes the overlapping error between two different
%annotations (intervariability), and also the overlapping error between two
%different sessions (intravariability)
fid = fopen('FDLabeled2.txt','w');
fprintf(fid,'video2.mat\n');
fprintf(fid,'Observer: Face detector\n');
for z = 1:3
    labelings1= readFile('Labelings/Labeling2-Facedetect_CORRECT.txt',z);
    labelings2= readFile('Labelings/Ahmed2.txt',z);
    fprintf(fid,'Session: %d\n',z);
    % % labelings1 = readFile(file1,1);
    % % labelings2 = readFile(file2,1);
    % misses=0;
    total_overlap=0;
    overlappings = 0;
    for i=1
        frames1=unique([labelings1.data{i}.framenum]);
        frames2=unique([labelings2.data{i}.framenum]);
        commonFrames=intersect(frames1,frames2);
        for j=commonFrames
            facesFrame1=labelings1.data{i}([labelings1.data{i}.framenum]==j);
            facesFrame2=labelings2.data{i}([labelings2.data{i}.framenum]==j);
            %misses = misses + abs(length(facesFrame1)-length(facesFrame2));
            overlap=zeros(length(facesFrame1),length(facesFrame2));
            for k=1:length(facesFrame1)
                for l=1:length(facesFrame2)
    %                 p1x = max(facesFrame1(k).x-facesFrame1(k).w/2,facesFrame2(l).x-facesFrame2(l));
    %                 p1y = max(facesFrame1(k).y-facesFrame1(k).w/2,facesFrame2(l).y-facesFrame2(l));
    %                 p2x = min(facesFrame1(k).x+facesFrame1(k).w/2,facesFrame2(l).x+facesFrame2(l));
    %                 p2y = min(facesFrame1(k).y+facesFrame1(k).w/2,facesFrame2(l).y+facesFrame2(l));
                    intersection = rectint([facesFrame1(k).x-facesFrame1(k).w/2 facesFrame1(k).y-facesFrame1(k).h/2 facesFrame1(k).w facesFrame1(k).h],...
                                           [facesFrame2(l).x-facesFrame2(l).w/2 facesFrame2(l).y-facesFrame2(l).h/2 facesFrame2(l).w facesFrame2(l).h]);
                    union_ = facesFrame1(k).w*facesFrame1(k).h + facesFrame2(l).w*facesFrame2(l).h - intersection;
                    overlap(k,l)= intersection / union_;
                    if overlap(k,l)>0.5
                        fprintf(fid,'%d [%d %d %d %d] %s\n',facesFrame1(k).framenum,facesFrame1(k).x, facesFrame1(k).y,facesFrame1(k).w,facesFrame1(k).h, facesFrame2(l).label);
                    end
                end
            end

        end
    end
end
fclose(fid);