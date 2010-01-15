session = {'Labelings/Lluis1_session1.txt','Labelings/Lluis1_session2.txt','Labelings/Lluis1_session3.txt'};
missess = zeros(length(session));
overlaps = zeros(length(session));

% sesion[1] = fopen('Labelings/Lluis1_session1.txt','r');
% sesion2 = fopen('Labelings/Lluis_session2.txt','r');
% sesion3 = fopen('Labelings/Lluis_session3.txt','r');

for i=1:length(session)
    for j=i:length(session)
        [misses,overlap] = intravariability(session{i},session{j});
        overlaps(i,j) = overlap;
        missess(i,j) = misses;        
    end    
end

figure,imagesc(overlaps + overlaps'),colorbar,title('Overlaps')
figure,imagesc(missess + missess'),colorbar,title('Misses')

overlap_values = [overlaps(1,2:end) overlaps(2,3:end) overlaps(3,4:end) overlaps(4,5:end) overlaps(5,6)];
misses_values = [missess(1,2:end) missess(2,3:end) missess(3,4:end) missess(4,5:end) missess(5,6)];

disp(['Mean overlapping error: ' num2str(mean(overlap_values))])
disp(['Std overlapping error: ' num2str(std(overlap_values))])
disp(['Mean number of missess: ' num2str(mean(misses_values))])
disp(['Std number of missess: ' num2str(std(misses_values))])
