function [labeling] = readFile(filename)
%READFILE Reads a text file with the recorded labelings

% Number of sessions
session_num=3;

% Open the TXT file and read video name and expert name
fid=fopen(filename,'r');
labeling.videoname=fgets(fid);
labeling.expertname=fgets(fid);

% Initialize a cell array for storing each session in one different
% position of the array
labeling.data=cell(session_num,1);

% Read the next line of the file
buffer = fgets(fid);

% While not reaching the end of file
while (buffer~=-1)
    % Parse the string to see if it's the starting of a new session
    session=sscanf(buffer,'Session: %d');
    
    if (isempty(session))
        % If the line read is not a new session it must be a frame entry,
        % so we parse the string with the correct format and store the data
        % in a new position of the current session cell position

        facecount
        framedata = sscanf(buffer,'%d [%f %f %f %f] %s');
        labeling.data{current_session}(facecount).framenum = framedata(1);
        labeling.data{current_session}(facecount).x = framedata(2);
        labeling.data{current_session}(facecount).y = framedata(3);
        labeling.data{current_session}(facecount).w = framedata(4);
        labeling.data{current_session}(facecount).h = framedata(5);
        labeling.data{current_session}(facecount).label = char(framedata(6:end)');
        facecount=facecount+1;
    else
        % The line read indicates the start of a new session, so update the
        % session counter, and reset the face counter
        current_session=session;
        facecount=1;
    end
    buffer = fgets(fid);
end

fclose(fid)