% Given data points
xi = [1.0, 1.1, 1.3, 1.5, 1.9, 2.1];
yi = [1.84, 1.96, 2.21, 2.45, 2.94, 3.18];

% Construct the Vandermonde matrix
A = [ones(length(xi),1), xi', xi'.^2];

% Calculate the coefficients using Singular Value Decomposition (SVD)
[U, S, V] = svd(A, 0);
S_inv = zeros(size(S'));
S_inv(1:size(S, 1), 1:size(S, 1)) = diag(1./diag(S));

% Compute the pseudo-inverse of A
A_plus = V * S_inv * U';

% Compute the least squares solution
c = A_plus * yi';

% Evaluate the polynomial
x = linspace(min(xi), max(xi), 100);
y = c(1) + c(2) * x + c(3) * x.^2;

% Calculate the least square errors
y_predicted = A * c;
error = norm(y_predicted' - yi);

% Display the results
disp('Coefficients of the polynomial:');
disp(c);
disp('yi:');
disp(yi);
disp('A:');
disp(A);
disp('U:');
disp(U);
disp('V:');
disp(V);
disp('A:');
disp(A_plus);
disp('S:');
disp(S);
disp('S_inv:');
disp(S_inv);

disp('y_predicted:');
disp(y_predicted);
disp('Least square error:');
disp(error);

% Plot the original data and the fitted polynomial
plot(xi, yi, 'o', x, y, '-');
xlabel('x');
ylabel('y');
legend('Data points', 'Fitted Polynomial');
