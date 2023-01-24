function MSD = MSD_2D(x, y)
    if length(x)==length(y)
        MSD = MSD_1D(x) + MSD_1D(y);        
    else
       disp('ERROR: vectors length must be the same') 
    end
end