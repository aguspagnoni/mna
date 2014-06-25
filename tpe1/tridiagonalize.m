function T=tridiagonalize(A)
  dim = length(A(1,:));
  H = A;
  for i=1:dim-2
    x = A(:,i);
    first_n = eye(dim,i+1)*ones(i+1,1);
    y = x.*first_n;
    s = sign(x(i+1)) * norm(x(i+1:dim));
    y(i+1) = -s;
    w = (x-y)/norm(x-y);
    P = eye(dim) - 2*w*w';
    A = P*A*P;
  end
  T = A;
end
