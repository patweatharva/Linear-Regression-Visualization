function [X_norm] = featureScaling(X)

mu = mean(X);
sigma= std(X);
X_norm= zeros(size(X));

for i= 1:size(X,1)

X_norm(i,:) = (X(i,:)- mu)./sigma ;

end

end

