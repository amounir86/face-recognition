% video1 = {'Anjan1.txt','Cristian1.txt','Isaac1.txt','Lluis1.txt','Patricia1.txt','Labeling1-Facedetect_CORRECT.txt'};
video1 = {'Ahmed2.txt','Isaac2.txt','Jaume2.txt','Nadeem2.txt','Xenia2,txt','Labeling2-Facedetect_CORRECT.txt'};
% video1 = {'Lluis1_sessio1.txt
missess = zeros(length(video1));
overlaps = zeros(length(video1));

for i=1:length(video1)
    for j=i:length(video1)
        [misses,overlap] = intervariability(['Labelings/' video1{i}], ['Labelings/' video1{j}],1);
        overlaps(i,j) = overlap;
        missess(i,j) = misses;
    end
end

figure,imagesc(overlaps + overlaps'),colorbar,title('Overlapping error')
figure,imagesc(missess + missess'),colorbar,title('Misses')

overlap_values = [overlaps(1,2:end) overlaps(2,3:end) overlaps(3,4:end) overlaps(4,5:end) overlaps(5,6)];
misses_values = [missess(1,2:end) missess(2,3:end) missess(3,4:end) missess(4,5:end) missess(5,6)];

disp(['Mean overlapping error: ' num2str(mean(overlap_values))])
disp(['Std overlapping error: ' num2str(std(overlap_values))])
disp(['Mean number of missess: ' num2str(mean(misses_values))])
disp(['Std number of missess: ' num2str(std(misses_values))])