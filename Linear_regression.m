data= table2array(readtable("data.txt"));

X= data(: ,1:end-1);
y= data(: , end);
iter  = 2500;
alpha=  0.01;


% feature scaling
temp= featureScaling(X);

% adding extra feature
X_norm = [ones(size(X,1),1), temp ];
X = [ones(size(X,1),1),X];

[theta, theta1 ,J_vals_fs, J_vals, ~] = gradientDescent(X_norm,X,y,alpha,iter);

disp(theta)
disp(theta1)
