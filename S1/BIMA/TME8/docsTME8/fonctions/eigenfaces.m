function [u, Lambda] = eigenfaces(imacent)
A = reshape(imacent, [size(imacent,1) * size(imacent,2), size(imacent,3)]);
[u, s, v] = svd(A,0);
Lambda = diag(s.^2);
end