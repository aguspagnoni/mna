function [Q R] = qr_impl(A)
    dim = length(A(1, :));
    V = A;
    Q = A;
    R = A;
    for i = 2:dim
        sub = zeros(dim, 1);
        for j = i-1:-1:1
            scalar_product = A(:,j)' * A(:,i);
            sub = sub + (A(:,j) .*  scalar_product/(norm(A(:,j))^2));
            sub
        end
        V(:, i) = A(:, i) - sub;
    end
    for i = 1:dim
        Q(:,i) = V(:,i)/norm(V(:,i));
    end
    R = Q'*A;
end
