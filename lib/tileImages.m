
function imArr = tileImages(imageIds)
% imageIds is a vector of 100 image ids
imArr = uint8(zeros(640,640,3));
for i = 1 : 10
    top = (i-1) * 64 + 1;
    for j = 1 : 10
        left = (j-1) * 64 + 1;

        im = getThumbnail(imageIds((i-1)*10 + (j-1) + 1));

        imArr(top:top + 63,left:left+63,1:3) = im;
    end
end

imshow(imArr);
set(gcf,"Visible","on");
end