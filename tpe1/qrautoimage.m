function out = autoimage(autoimg)
    a = imread('lena512.bmp');
    % b es de 256x1024, un bloque en cada columna
    b = im2col(a, [16 16], 'distinct');
    m = mean(double(b));
    m = m.';
    M = repmat(m, 1, 256)';
    ds = double(b)-M;
    cc = cov(double(b'));
    [V,D] = qr_with_shifts(cc);
    % ordeno los autovalores de mayor a menor
    D = diag(D);
    [D,i] = sort(D,'descend');
    D = diag(D);
    V = V(:,i);
  
    d = M;
    for k = 1:1024
        for j = autoimg
            pv1 = V(:,j).'*ds;
            d(:,k) = d(:,k) + pv1(k)*V(:,j);
        end
    end
    % d es una matriz de 1024x256   
    compimg = col2im(d,[16,16],[512,512],'distinct');
    compimg = uint8(round(compimg));
    imshow(compimg)  
end
