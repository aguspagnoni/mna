function out = autoimage2(autoimg)  
    a = imread('lena512.bmp');
    b = im2col(a,[16,16],'distinct');
    m = mean(double(b.'));
    m = m.';
    M = repmat(m,1,1024);
    d = col2im(M,[16,16],[512,512],'distinct'); meanimg = uint8(round(d));
   ds = double(b)-M;
   cc = cov(double(b'));
    length(cc(1,:))
    length(cc(:,1))
   [V,D] = eig(cc);
   % ordeno los autovalores de mayor a menor
   D = diag(D);
   [D,i] = sort(D,'descend');
   D = diag(D);
   V = V(:,i);
   % muestro la primera ''autoimagen''
   c = (V(:,1)-min(V(:,autoimg)))*256/(max(V(:,autoimg))-min(V(:,autoimg)));
   dv1 = col2im(c,[16,16],[16,16],'distinct');
   dv1 = uint8(round(dv1));
   imshow(dv1)
   % proyecto la primer autoimagen
   pv1 = V(:,autoimg).'*ds;
   % si solamente considero la primer autoimagen...
   d = M;
   for k = 1:1024
      d(:,k) = d(:,k) + pv1(k)*V(:,autoimg);
   end
   compimg = col2im(d,[16,16],[512,512],'distinct');
   compimg = uint8(round(compimg));
   imshow(compimg)
end
