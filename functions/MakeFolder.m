%% -  --  --  --  --  --  --  --  ---  --  --  --  --  --  --  --  --  - %%
% ---------------------------- Folder Maker ----------------------------- %
% -------------------------- by Edgardo Rosas --------------------------- %
% ----------------------------------------------------------------------- %
%% Inputs                                                                 %
% -Directory: Directiory where you want a new folder                      %
% -Name: Name of the folder                                               %
%% Outputs                                                                %
% -Folder: PathName of the folder                                         %
%% --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- %
function Folder = MakeFolder(Directory, Name)
    Folder = strcat(Directory, filesep, Name); %folder for all the analysis
    if ~isfolder(Folder)
        mkdir(Folder);
    end
end