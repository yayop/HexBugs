tic
VideoPathName = '/Users/edgardorosas/Desktop/Hexbugs/MVI_7801.MP4';
NParticles = 1;
Video = VideoReader(VideoPathName);
NFrames = Video.NumFrames;
VideoName = regexprep(Video.Name,'.MP4','','ignorecase');
VideoFolder = MakeFolder(Video.Path, VideoName);
AnalysisFolder = MakeFolder(VideoFolder, 'Analysis2');

r_min = 33;
r_max = 37;
sensitivity = 0.90;
x = zeros(NFrames,NParticles);
y = zeros(NFrames,NParticles);
r = zeros(NFrames,NParticles);
for j=1:NParticles 
    [~, Crop(j,:)] = imcrop(read(Video, 1));
    close all
    for i=1:NFrames
        J = imcrop(read(Video, i), Crop(j,:));
        [center_, R_] = imfindcircles(J, [r_min, r_max],'Method','TwoStage', ...
        'Sensitivity', sensitivity);
        while isempty(center_)==1
            sensitivity = sensitivity + 0.01;
            [center_, R_] = imfindcircles(J, [r_min, r_max],'Method','TwoStage', ...
            'Sensitivity', sensitivity);
        end
        x(i,j) = center_(1,1)+Crop(j,1);
        y(i,j) = center_(1,2)+Crop(j,2);
        r(i,j) = R_(1);
        sensitivity = 0.90;
        %imshow(J)
        %hold on
        %viscircles(center_, R_)
        %hold off
        Crop(j,:) = [x(i,j)-1.1*r(i,j); y(i,j)-1.1*r(i,j); 2.2*r(i,j); 2.2*r(i,j)]';
    end
    
end
save(strcat(AnalysisFolder,'/','Tracking.mat'),'x','y','r');
toc