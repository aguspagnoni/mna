a = imread('lena512.bmp');
%imshow(a) % muestro la imagen original
b = im2col(a,[16,16],'distinct');
m = mean(double(b));
m = m.';
M = repmat(m,1,256);
d = col2im(M',[16,16],[512,512],'distinct');
meanimg = uint8(round(d));
imshow(meanimg) % muestro la imagen ‘‘media’’
