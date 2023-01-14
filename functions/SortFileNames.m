%% -  --  --  --  --  --  --  --  ---  --  --  --  --  --  --  --  --  - %%
% ------------------------ Image Sequence sorter ------------------------ %
% -------------------------- by Edgardo Rosas --------------------------- %
% ----------------------------------------------------------------------- %
%% Inputs                                                                 %
% -Folder: Folder Pathname of the image sequance                          %
% -Format: Image format of the sequence eg: '.tif' ; '.jpg'               %                           %
%% Outputs                                                                %
% -n: number or images                                                    %
% -FileNames: cell struct (vector) containing each image name             %
%% --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- %
function [n, FileNames] = SortFileNames(Folder, Format)
    FileNames = {};
    info = dir([Folder, filesep, Format]); 
    n = length(info);
    [FileNames{1:n, 1}] = deal(info.name);
    FileNames = sortrows(FileNames);
end