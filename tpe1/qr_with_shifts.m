function [V,D]=qr_with_shifts(A)
  T = tridiagonalize(A);
  dim = length(A(1,:));
  tol = 0.001;
  Qavec = eye(dim);
  D = zeros(dim);

  for m=dim:-1:2
    while(A(m-1,m) > tol)
      [Q,R] = qr(A - A(m,m)*eye(m));
      A = R*Q + A(m,m)*eye(m);
    end
    Qavec(1:m, 1:m) = Qavec(1:m,1:m)*Q;
    D(m,m) = A(m,m);
    A = A(1:m-1,1:m-1);
  end
  D(1,1) = A(1,1);
  V = Qavec;
end
