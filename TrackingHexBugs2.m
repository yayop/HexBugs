tic
VideoPathName = '/Users/edgardorosas/Desktop/MVI_7741_.MP4';
Video = VideoReader(VideoPathName);
NFrames = Video.NumFrames;
VideoName = regexprep(Video.Name,'.MP4','','ignorecase');
AnalysisFolder = MakeFolder(Video.Path, 'Analysis2');
[~, CropCoordinates] = imcrop(read(Video, 1));
close all
x = zeros(1,NFrames);
y = zeros(1,NFrames);
r = zeros(1,NFrames); 
parfor i = 1:NFrames
    I = imcrop(read(Video,i), CropCoordinates);
    r_min = 23;
    r_max = 27;
    sensitivity = 0.90;
    [center, R] = imfindcircles(I, [r_min, r_max],...
        'Method','TwoStage','Sensitivity', sensitivity);
    while isempty(center) == 1  
        sensitivity = sensitivity + 0.001;
        [center, R] = imfindcircles(I, [r_min, r_max],'Method',...
        'TwoStage','Sensitivity',sensitivity); 
    end
    xCircle = center(1,1);
    yCircle = center(1,2);
    x(i) = xCircle;
    y(i) = yCircle;
    r(i) = R(1);
end
save(strcat(AnalysisFolder,'/','Tracking.mat'),'x','y','r');
toc
