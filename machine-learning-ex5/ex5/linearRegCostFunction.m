function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%



predictions = X*theta;
sqErrors = (predictions-y).^2;

pError = (X * theta) - y;
thetaChange = ((1/m)*(X'*pError));

theta(1) = 0;
J = ((1/(2*m))*sum(sqErrors)) +((lambda/(2*m))*sum(theta.^2));

                      
grad = thetaChange + (lambda/m)*theta;










% =========================================================================

grad = grad(:);

end
