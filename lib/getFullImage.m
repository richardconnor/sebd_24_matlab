
function image = getFullImage(id)
path = "/Volumes/Data/mf/images/";

imageId = int32(id);
imageName = imageId;
dir = num2str(idivide(imageId , 10000));

fname = strcat(path,dir,"/",num2str(imageName),".jpg");

image = imread(fname);
end
