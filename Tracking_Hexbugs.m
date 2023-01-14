%% -  --  --  --  --  --  --  --  ---  --  --  --  --  --  --  --  --  - %%
% ------------------------ Tracking for Hexbugs ------------------------- %
% -------------------------- by Edgardo Rosas --------------------------- %
% ----------------------------------------------------------------------- %
%% Inputs                                                                 %
% -VideoPathName: folder pathname of the image sequance                   %                            %
%% Outputs                                                                %
% -x: x position of each frame                                            %
% -y: y position of each frame                                            %
% -t: fitted radius of each frame                                         %
%% --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- %
VideoPathName = '/Users/edgardorosas/Desktop/MVI_7741_';
[NImages, ImgFilenames] = SortFileNames(VideoPathName, '*.tif');   
AnalysisFolder = MakeFolder(VideoPathName, 'Analysis');
x = zeros(1,NImages); y = zeros(1,NImages); r = zeros(1,NImages);
parfor i = 1:NImages
    Img = fullfile(VideoPathName, ImgFilenames{i});
    I = imread(Img);
    r_min = 23;
    r_max = 27;
    sensitivity = 0.90;
    [center, R] = imfindcircles(I, [r_min, r_max],...
        'Method','TwoStage','Sensitivity', sensitivity);
    while isempty(center) == 1  
        sensitivity = sensitivity + 0.005;
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

