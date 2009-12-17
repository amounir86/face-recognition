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

figure,imagesc(overlaps + overlaps'),colorbar
figure,imagesc(missess + missess'),colorbar

disp(['Mean overlapping error: ' num2str(mean(mean(overlaps)))])
disp(['Mean number of missess: ' num2str(mean(mean(missess)))])



