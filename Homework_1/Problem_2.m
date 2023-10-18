% Given system of equations
A = [4 2; 1 2];
b = [10.488; 7.119];
xnumerical = [1; 3];

% Calculate the true solution
xtrue = A\b;

% Calculate the numerical solution
xnumeric = xnumerical;

% Calculate the forward error
forward_error = norm(xtrue - xnumeric);

% Calculate the backward error
backward_error = norm(A*xnumeric - b);

fprintf('Forward Error: %f\n', forward_error);
fprintf('Backward Error: %f\n', backward_error);