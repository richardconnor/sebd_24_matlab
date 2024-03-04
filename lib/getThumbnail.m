
function image = getThumbnail(id)
%the id is an image id in the full data set, eg starts with 0
%thumbnail images are indexed from 1...
path = "/Volumes/Data/mf/thumbnails/";

imageId = int32(id);
imageName = imageId + 1;
dir = num2str(idivide(imageId , 10000) + 1);

fname = strcat(path,dir,"/im",num2str(imageName),".jpg");

image = imread(fname);
end