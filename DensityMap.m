[X,Y] = meshgrid(1:1920, 1:1080);
R = 36;
NFrames = size(x,1);
%NFrames = 1000;
InsDensity = zeros(1080, 1920);
MeanDensity = zeros(1080, 1920);
for i = 1:25:NFrames
    figure(1)
    InsDensity = Density(X,Y,r(i,:),x(i,:),y(i,:));
    imagesc(InsDensity);
    set(gca,'YDir','normal');
    colormap(jet);
    figure(2)
    MeanDensity = MeanDensity + InsDensity;
    MaxDensity = max(MeanDensity,[],'all');
    imagesc(MeanDensity/MaxDensity);
    set(gca,'YDir','normal');
    colormap(jet);
end
figure(3)
imagesc(MeanDensity)
set(gca,'YDir','normal');
colormap(jet);
