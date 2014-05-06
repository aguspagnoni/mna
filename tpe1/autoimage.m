function out = autoimage(autoimg)
    a = imread('lena512.bmp');
    b = im2col(a, [16 16], 'distinct');
    m = mean(double(b));
    m = m.';
    M = repmat(m, 1, 256)';
    ds = double(b)-M;
    cc = cov(double(b'));
    [V,D] = eig(cc);
    % ordeno los autovalores de mayor a menor
    D = diag(D);
    [D,i] = sort(D,'descend');
    D = diag(D);
    V = V(:,i);
    % muestro la primera ''autoimagen''
    c = (V(:,autoimg)-min(V(:,autoimg)))*256/(max(V(:,autoimg))-min(V(:,autoimg)));
    dv1 = col2im(c,[16,16],[16,16],'distinct');
    dv1 = uint8(round(dv1));
    imshow(dv1);
    % proyecto la primer autoimagen
    % me queda la proyeccion en cada fila (producto interno)
    pv1 = V(:,autoimg).'*ds;
    % si solamente considero la primer autoimagen...
    d = M;
    for k = 1:1024
      d(:,k) = d(:,k) + pv1(k)*V(:,autoimg);
    end
    % d es una matriz de 1024x256   
    compimg = col2im(d,[16,16],[512,512],'distinct');
    compimg = uint8(round(compimg));
    imshow(compimg)  
end
