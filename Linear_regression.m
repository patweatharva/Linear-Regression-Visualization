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

%Applying Linear regression
[theta, theta1 ,J_vals_fs, J_vals, ~] = gradientDescent(X_norm,X,y,alpha,iter);

fig1=figure;
subplot(1,2,1);
plot(J_vals,'r');
xlabel("Iteration");
ylabel("Cost value without feature scaling");
subplot(1,2,2);
plot(J_vals_fs,'b');
xlabel("Iteration");
ylabel("Cost value with feature scaling");
hold off;

learning_rate=[0.001,0.003,0.01,0.03,0.1,0.3,1];
fig2=figure;
hold on;
for i=1:length(learning_rate)
    [~,~,J_vals_fs,~,~]= gradientDescent(X_norm,X,y,learning_rate(i),iter);
    plot(J_vals_fs)
end
legend("0.001","0.003","0.01","0.03","0.1","0.3","1");
xlabel("iteration");
ylabel("Cost value");
hold off;
