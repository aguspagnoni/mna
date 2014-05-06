function out = autoimage2()  
    a = imread('lena512.bmp');
    imshow(a) % muestro la imagen original
    b = im2col(a,[16,16],'distinct');
    m = mean(double(b.'));
    m = m.';
    M = repmat(m,1,1024);
    d = col2im(M,[16,16],[512,512],'distinct'); meanimg = uint8(round(d));
    imshow(meanimg) % muestro la imagen ‘‘media'' 
   ds = double(b)-M;
   cc = cov(double(b'));
   [V,D] = eig(cc);
   % ordeno los autovalores de mayor a menor
   D = diag(D);
   [D,i] = sort(D,'descend');
   D = diag(D);
   V = V(:,i);
   % muestro la primera ''autoimagen''
   c = (V(:,1)-min(V(:,1)))*256/(max(V(:,1))-min(V(:,1)));
   dv1 = col2im(c,[16,16],[16,16],'distinct');
   dv1 = uint8(round(dv1));
   imshow(dv1)
   % proyecto la primer autoimagen
   pv1 = V(:,1).'*ds.';
   % si solamente considero la primer autoimagen...
   d = M;
   for k = 1:1024
      d(:,k) = d(:,k) + pv1(k)*V(:,1);
   end
   compimg = col2im(d,[16,16],[512,512],'distinct');
   compimg = uint8(round(compimg));
   imshow(compimg)
end
