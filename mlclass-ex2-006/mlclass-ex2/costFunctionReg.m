function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

sigmaX = sigmoid(X * theta);
J = (sum((-y'*log(sigmaX))-((1 .- y')*log(1 .- sigmaX))) / m) + ((lambda/(2*m)) * (sum(theta .^ 2)-(theta(1) .^ 2)));

theta_reg = theta_reg = [0;theta(2:end, :);];
grad = (((sigmaX - y)' * X) / m )+ ((lambda/m).*theta_reg');
% grad(1) = ((sigmaX(1) - y(1))' * X(1)) / m;




% =============================================================

end
