function [ pinvA ] = pseudoInverseMat(A, lambda)
% Input: Any m-by-n matrix, and a damping factor.
% Output: An n-by-m pseudo-inverse of the input according to the Moore-Penrose formula

% Get the number of rows (m) and columns (n) of A
[m, n] = size(A);

% TODO: complete the computation of the pseudo-inverse.
% Hint: How should we account for both left and right pseudo-inverse forms?
%pinvA = zeros(n, m);
if m > n
    pinvA=inv(transpose(A)*A+lambda^2*eye(n))*transpose(A);
elseif m < n
    pinvA=transpose(A)*inv(A*transpose(A)+lambda^2*eye(m));
else
    pinvA=inv(A);
end
end
