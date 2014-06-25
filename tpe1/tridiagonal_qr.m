function next_A = tridiagonal_qr(A)
    next_A = A;

    a_values = zeros(1, length(A(:,1)));
    b_values = zeros(1, length(A(:,1))); 
    c_values = zeros(1, length(A(:,1)));
    s_values = zeros(1, length(A(:,1)));
    for i = 1:length(A(:,1))
        a_values(i) = A(i,i);
        if (i < length(A(:,1)))
            b_values(i) = A(i,i+1);
        end
    end

    t = b_values(1);
    for i = 1:(length(A(:,1)) - 1)
        r = sqrt(a_values(i)^2 + t^2);
        c_values(i) = a_values(i)/r;
        s_values(i) = t/r;
        
        a_values(i) = r;
        t = b_values(i);
        
        b_values(i) = t * c_values(i) + a_values(i+1) * s_values(i);
        a_values(i+1) = - (t * s_values(i)) + a_values(i+1) * c_values(i);

        if (i != (length(A(:, 1)) - 1))
            t = b_values(i+1);
            b_values(i+1) = t * c_values(i);
        end
    end

    for i = 1:(length(A(:,1)) - 1)
        next_A(i,i) = a_values(i) * c_values(i) + b_values(i) * s_values(i);
        nextb = a_values(i+1) * s_values(i);
        next_A(i, i+1) = nextb;
        next_A(i+1, i) = nextb;
        a_values(i+1) = a_values(i+1) * c_values(i);
        next_A(i+1, i+1) = a_values(i+1);
    end
end
