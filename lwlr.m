data=load('lwlr_data.txt');
x=data(:,1)
y=data(:,2)
% store the number of training points
m = length(y); 
% Adding a column of ones to x
x = [ ones(m,1) x]; 
% number of attributes
n = size(x,2); 
theta_vec = inv(x'*x)*x'*y;
tau = [1 10 25 ];
y_est = zeros(length(tau),length(x));
fprintf('Solution to the Problem 2 part (b) \n\n\n');
for iter1 = 1:length(tau)
	for iter2 = 1:m
		w_iter2 = exp(-(x(iter2,2) - x(:,2)).^2./(2*(tau(iter1)^2)));
		W = diag(w_iter2);
		theta_vec = inv(x'*W*x)*x'*W*y;
		y_est(iter1, iter2) = x(iter2,:)*theta_vec;
		if iter2==11
			fprintf('After 11.5 hours, Predicted number of views of the magazine = %f when tau=%f \n', [1 11.5]*theta_vec, tau(iter1));
		end
	end
end
figure;
plot(x(:,2),y,'ks-'); hold on
plot(x(:,2),y_est(1,:),'bp-');
plot(x(:,2),y_est(2,:),'rx-');
plot(x(:,2),y_est(3,:),'g*');
legend('measured', 'predicted, tau=1', 'predicted, tau=10','predicted, tau=25');
grid on;
xlabel('Number of hours after publication, x');
ylabel('Page view number for that hour, y');
title('Measured and predicted page view numbers with weighted least squares');
