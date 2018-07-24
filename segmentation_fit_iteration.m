% TODO: Put in the name of the desired image (line below)
image_name = 'test1';

masknames = [{'GROTRU'},{'EGGER'},{'FCN'},{'DUMMY'}];

fig = figure("Name",strcat("segmentation and mask of ",image_name," in every 5th iteration"));
titles = ["GROTRU","EGGER","FCN","NO\_OCCLUSION"];
subplot_no=1;
for maskname=masknames
    maskname = maskname{1};
    path_seg = fullfile('segmentations',strcat(image_name,'_',maskname,'_',num2str(0),'.png'));
    gallery = imread(path_seg); 
    path_fit = fullfile('fits',strcat(image_name,'_',maskname,'_',num2str(0),'.png'));
    gallery = [gallery;imread(path_fit)];
    
    is = [4,9,14,19];
    for i=is
        path_seg = fullfile('segmentations',strcat(image_name,'_',maskname,'_',num2str(i),'.png'));
        path_fit = fullfile('fits',strcat(image_name,'_',maskname,'_',num2str(i),'.png'));
        gallery = [gallery,[imread(path_seg);imread(path_fit)]];
    end
    [h,b,t] = size(gallery);
    subplot(1,4,subplot_no), imshow(permute(gallery,[2 1 3]))
    title=text(-60,b/2+600,strcat("segmentation and mask of ",image_name," in every 5th iteration with mask: ",titles(subplot_no),"(from right to left)"));
    set(title,'Rotation',90);
    subplot_no = subplot_no+1;
    hold off
end
