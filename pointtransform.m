function Y = pointtransform(X, x1, y1, x2, y2)
%POINTTRANSFORM Summary of this function goes here
%   Detailed explanation goes here
if (x1==0)
    alpha = inf;
else
    alpha = y1/x1;
end
if (x2==x1)
    beta = inf;
else
    beta = (y2-y1)/(x2-x1);
end
if (x2==1)
    gamma = inf;
else
    gamma = (1-y2)/(1-x2);
end

Y=X;

for i = 1:size(Y,1)
   for j = 1:size(Y,2)
          
   end
end


end

