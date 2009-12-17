video1 = {'Anjan1.txt','Cristian1.txt','Isaac1.txt','Lluis1.txt','Patricia1.txt'};
missess = zeros(length(video1));
overlaps = zeros(length(video1));

for i=1:length(video1)
    for j=i:length(video1)
        [misses,overlap] = intervariability(['Labelings/' video1{i}], ['Labelings/' video1{j}],1);
        overlaps(i,j) = overlap;
        missess(i,j) = misses;
    end
end

figure,imagesc(overlaps + overlaps'),colorbar
figure,imagesc(missess + missess'),colorbar

disp(['Mean overlapping error: ' num2str(mean(mean(overlaps)))])
disp(['Mean number of missess: ' num2str(mean(mean(missess)))])