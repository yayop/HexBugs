function MSD = MSD_1D(x)
    N = length(x);
    MSD = NaN(1,N-1);
    for n = 1:N-1
        dx = circshift(x, -n) - x;
        dx(N-n+1:N) = [];
        MSD(n) = mean(dx.^2); 
    end
end