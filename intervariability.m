function [misses, overlap_p ] = intervariability(file1,file2,session_num)
%INTERVARIABILITY Computes the overlapping error between two different
%annotations (intervariability), and also the overlapping error between two
%different sessions (intravariability)

labelings1 = readFile(file1,session_num);
labelings2 = readFile(file2,session_num);
misses=0;
total_overlap=0;
overlappings = 0;
for i=session_num
    frames1=unique([labelings1.data{i}.framenum]);
    frames2=unique([labelings2.data{i}.framenum]);
    commonFrames=intersect(frames1,frames2);
    notCommon = setdiff(frames1,commonFrames);
    for j=notCommon
        misses = misses + sum([labelings1.data{i}.framenum] == j);
    end
    for j=commonFrames
        facesFrame1=labelings1.data{i}([labelings1.data{i}.framenum]==j);
        facesFrame2=labelings2.data{i}([labelings2.data{i}.framenum]==j);
        misses = misses + abs(length(facesFrame1)-length(facesFrame2));
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
            end
        end
        total_overlap = total_overlap + sum(sum(1-overlap(overlap>0.5)));
        overlappings = overlappings + sum(sum(overlap>0.5));
    end
end

overlap_p = (total_overlap + misses) / (overlappings + misses);
%overlap_p = total_overlap / overlappings;