function Z = Density(x,y,r,x1,y1)
    N = length(x1);
    Z = 0;
    for i = 1:N
        Z = Z + exp(-((x-x1(i)).^2/(2*r(i)^2) + (y-y1(i)).^2/(2*r(i)^2)));
    end
end
