%% Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all

%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions
%  in this exericse:
%
%     lrCostFunction.m (logistic regression cost function)
%     oneVsAll.m
%     predictOneVsAll.m
%     predict.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
num_labels = 10;          % 10 labels, from 1 to 10
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset.
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

mdata  = csvread('train.csv'); % training data stored in arrays X, y
X = mdata(2:42000,2:785);
y = mdata(2:42000,1);
for i = 1:length(y)
   if y(i) ==0
      y(i) = 10;
   end
end
m = size(X, 1);

%% ============ Part 2: Vectorize Logistic Regression ============
%  In this part of the exercise, you will reuse your logistic regression
%  code from the last exercise. You task here is to make sure that your
%  regularized logistic regression implementation is vectorized. After
%  that, you will implement one-vs-all classification for the handwritten
%  digit dataset.
%

fprintf('\nTraining One-vs-All Logistic Regression...\n')

lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

pred = predictOneVsAll(all_theta, X);
fprintf('\nTraining Set Accuracy: lambda: %f : %f\n',lambda, mean(double(pred == y)) * 100);

%% ================ Part 3: Predict for One-Vs-All ================
%  After ...

%tdata  = csvread('test.csv'); % training data stored in arrays X, y
%Xt = tdata(2:28001,:);
%pred = predictOneVsAll(all_theta, Xt);

%for i = 1:length(pred)
%   if pred(i) ==10
%      pred(i) = 0;
%   end
%end
