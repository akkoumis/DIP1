function Y = pointtransform(X, x1, y1, x2, y2)
%POINTTRANSFORM Summary of this function goes here
%   Detailed explanation goes here

alpha = y1/x1; % Matlab supports division by zero (Inf)
beta = (y2-y1)/(x2-x1); % Matlab supports division by zero (Inf)
gamma = (1-y2)/(1-x2); % Matlab supports division by zero (Inf)

Y = zeros(size(X,1),size(X,2));

for i = 1:size(X,1)
   for j = 1:size(X,2)
       if (X(i,j)<=x1)
           Y(i,j)=alpha*X(i,j);                   
       elseif (X(i,j)<x2)
           Y(i,j)=beta*(X(i,j)-x1)+y1;                   
       else
           Y(i,j)=gamma*(X(i,j)-x2)+y2;           
       end   
   end
end


end

