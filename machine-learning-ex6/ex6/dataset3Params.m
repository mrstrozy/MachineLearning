function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
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

%model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));

t = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

tmpC = 0;
tmpS = 0;
err = 100000000;
for i = t
    tmpC = i;
    for j = t
        fprintf("Err is: %0.2f\n", err);
        tmpS = j;
        fprintf("J is: %0.2f\n", j);
fprintf("i is: %0.2f\n", i);

        model= svmTrain(X, y, tmpC, @(x1, x2) gaussianKernel(x1, x2, tmpS));
        predictions = svmPredict(model, Xval);
        newerr = mean(double(predictions ~= yval));
        fprintf("newerr is: %0.2f", newerr);

        if (newerr < err)
            err = newerr;
            C = tmpC;
            sigma = tmpS;
        endif



    endfor
endfor

fprintf("\nC is: %f\n", C);
fprintf("sigma is %f\n", sigma);



% =========================================================================

end
