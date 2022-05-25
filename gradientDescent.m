function [theta, theta1, J_vals_fs, J_vals, success] = gradientDescent(X_norm, X, y, alpha,iter)


theta=zeros(size(X_norm,2),1);
J_vals=zeros(iter,1);
J_vals_fs=zeros(iter,1);
theta_vals=zeros(iter,1);
temp=zeros(size(X_norm,2),1);
temp1=zeros(size(X_norm,2),1);
m=size(X_norm,1); 

for j= 1:iter


for i= 1 : size(X_norm,2)
    temp(i,1) = theta(i) - (alpha * (1/m) * sum(((X_norm * theta)-y).*(X_norm(:, i))));
    temp1(i,1) = theta(i) - (alpha * (1/m) * sum(((X * theta)-y).*(X(:, i))));
end


theta=temp;
theta1=temp1; 

J_vals_fs(j,1) = computeCost(X_norm,y,theta);
J_vals(j,1) = computeCost(X,y,theta1);

end

success=0;




end

