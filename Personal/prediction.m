




%% Initialization
clear ; close all; clc


month = [1, 0];


data = load('sdata_dia.txt');
X = data(:, [1, 2]); y = data(:, 4);

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1
lambda = 1;
% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);
% Optimize
[theta, J, exit_flag] = ...
fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Compute accuracy on our training set
%p = predict(theta, X);

% Month | President Year
new_pred = sigmoid(month*theta);

%fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('DIA: %f\n', new_pred);

% ----------------------------------------------------

data = load('sdata_nasdaq.txt');
X = data(:, [1, 2]); y = data(:, 4);

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1
lambda = 1;
% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);
% Optimize
[theta, J, exit_flag] = ...
fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Compute accuracy on our training set
%p = predict(theta, X);

% Month | President Year
new_pred = sigmoid(month*theta);

%fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('NASDAQ: %f\n', new_pred);

%--------------------------------------------------------------

data = load('sdata_russell.txt');
X = data(:, [1, 2]); y = data(:, 4);

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1
lambda = 1;
% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);
% Optimize
[theta, J, exit_flag] = ...
fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Compute accuracy on our training set
%p = predict(theta, X);

% Month | President Year
new_pred = sigmoid(month*theta);

%fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Russell: %f\n', new_pred);

%----------------------------------------------------------------

data = load('sdata_snp.txt');
X = data(:, [1, 2]); y = data(:, 4);

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1
lambda = 1;
% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);
% Optimize
[theta, J, exit_flag] = ...
fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Compute accuracy on our training set
%p = predict(theta, X);

% Month | President Year
new_pred = sigmoid(month*theta);

%fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('SNP: %f\n', new_pred);
