function Y = histtransform(X, h, v)
%HISTTRANSFORM Summary of this function goes here
%   Detailed explanation goes here

Y = X;
total_num_of_pixels = size(Y,1) * size(Y,2);
old_values = unique(Y(:)); % A vector with all the values from the X image
h=[h 1];
new_index = 1; % Index for the new values (h, v)

count = 0; % Count to calculate the new h(i)

for old_index = 1:size(old_values,1)
    temp = old_values(old_index);
    
    for i = 1:size(Y,1)
        for j = 1:size(Y,2)
            if(X(i,j) == temp)
                new_h = count/total_num_of_pixels;
                while(new_h >= h(new_index))
                    new_index = new_index+1;
                    count = 0;
                    new_h = count/total_num_of_pixels;
                end
                Y(i,j) = v(new_index);
                count = count + 1;
            end
        end
    end  
end

end

