function out = compimage(autoimg)
    a = imread('lena512.bmp');
    % b es de 256x1024, un bloque en cada columna
    b = im2col(a, [16 16], 'distinct');
    % 1024 means, uno por cada columna
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
 
    % Transformamos los valores de los autovectores seleccionados para no
    % usar punto flotante. Se usan enteros de 8 bits.
    X = V(:, autoimg);
    A = zeros(length(autoimg), 2);
    for i = 1:length(X(1,:))
        A(i, 1) = max(X(:,i));
        A(i, 2) = min(X(:,i));
        X(:,i) = uint8((X(:,i)-A(i,2)).*255./((A(i,1))-A(i,2)));
    end

    % Modificamos los maximos y minimos de cada autovector para pasarlos 
    % como enteros de 16 bits. Se elevan al cuadrado para minimizar el error
    % de redondeo.
    A = int16(1./(A.^2)).*sign(A);

    % Realizamos la transformacion inversa de los valores minimo y maximo de cada autovector
    A = sqrt(abs(1./double(A))).*double(sign(A));

    % Transformamos cada autovector nuevamente a su rango original.
    for i = autoimg
        V(:, i) = (X(:,i)./256)*(A(i,1)-A(i,2))+A(i,2);
    end

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
