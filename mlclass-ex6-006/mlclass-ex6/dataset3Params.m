function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% get combination vector of C and sigma
% train model on single c and sigma
% apply model on different combination of C and sigma on validation set, store cost in new vector with C & sigma
% select c & sigma with lowest ccross vadlidtion set

constants = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
maxError = 99999;

for i = 1:size(constants,1)
	for j = 1:size(constants,1)
		tempC = constants(i);
		tempSigma = constants(j);
		model= svmTrain(X, y, tempC, @(x1, x2) gaussianKernel(x1, x2, tempSigma));
		predictions = svmPredict(model, Xval);
		diff = mean(double(predictions ~= yval))
		if(diff < maxError)
			C = tempC
			sigma = tempSigma
			maxError = diff
		end
	end
end




% =========================================================================

end
