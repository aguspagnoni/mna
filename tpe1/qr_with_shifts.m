function [V,D]=qr_with_shifts(A)
  T = tridiagonalize(A);
  dim = length(A(1,:));
  tol = 0.000001;
  Qavec = eye(dim);
  D = zeros(dim);
  for m=dim:-1:2
    while(A(m-1,m) > tol)
      next_A = tridiagonal_qr(A - A(m,m)*eye(m));
      A = next_A + A(m,m)*eye(m);
    end
    D(m,m) = A(m,m);
    A = A(1:m-1,1:m-1);
  end
  D(1,1) = A(1,1);
end
