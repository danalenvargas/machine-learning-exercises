function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    %itarative method, replacing with vectorized
    %{
    temp = zeros(2, 1);
    for j = 1 : 2
        
        sum = 0;
        for i = 1:m
            sum = sum + ((X(i,:) * theta) - y(i)) * X(i,j);
        end
       
        temp(j) = theta(j) - alpha * (sum/m);
    end
    
    theta(1) = temp(1);
    theta(2) = temp(2);
    %}
    
    
    delta = (X' * (X*theta - y)) / m;
    theta = theta - alpha * delta;
    
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end