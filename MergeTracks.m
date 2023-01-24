merFolderPath = '/Users/edgardorosas/Desktop/Hexbugs/MVI_7824/MVI_7824';
AnalysisFolder = MakeFolder(FolderPath, 'Analaysis');
NParticles = 24;
x = zeros(44977, NParticles);
y = zeros(44977, NParticles);
r = zeros(44977, NParticles);
for i = 1: NParticles
    TrackFolder = strcat(FolderPath, filesep, 'Analysis2_' + string(i));
    TrackFile = strcat(TrackFolder, filesep, 'Tracking.mat');
    data = load(TrackFile);
    x(:,i) = data.x;
    y(:,i) = data.y;
    r(:,i) = data.r;
end

save(strcat(AnalysisFolder,'/','Tracking.mat'),'x','y','r');
