function Y = histtransform(X, h, v)
%HISTTRANSFORM - Tranform Image X based on given histogram (h, v).
%   At first, we create a vector containing each unique value of the
%   brightness from X array (old_values). Then, we iterate through all the values of
%   said vector and replace all the recurrences of each value, at a time, with 
%   values from the vector v. This is done by checking the provided vector 
%   h and determining whether we exceed the frequency, pointed by the new_index.
%   If so, we move to the next element of both h and v, by incrementing the
%   new_index. This check is done after we finish replacing all the
%   recurrences of a given old_value, as commanded by the assigment.
%   X is the 2D array containing the values of the pixels' brightness.
%   h is a vector with the frequencies of appereance of the corresponding values, of vector v. 
%   v is a vector with the new values of the brightness.

Y = X; % Pre-allocate memory for better performance.
total_num_of_pixels = size(X,1) * size(X,2);
old_values = unique(X(:)); % A vector with all the unique brightness values from the X image.
%h=[h 1];  

new_index = 1; % Index for the given vectors (h, v), of the histogram to be approximated.
count = 0; % Count to calculate the current h(i).

% Iterate through all the unique old values of brightness.
for old_index = 1:size(old_values,1)
    temp = old_values(old_index); % The old value to be changed in the current iteration.
    
    % Iterate through all the pixels of the image.
    for i = 1:size(Y,1)
        for j = 1:size(Y,2)
            if(X(i,j) == temp) % Check if the pixel has the value that is to be changed now.
                Y(i,j) = v(new_index); % If so change it to the value pointed in the v vector.
                count = count + 1; % Increase the counter to check the h(i) later.
            end
        end
    end
    
    % Check if the current value of h(i) surpasses the given value on the h vector.
    new_h = count/total_num_of_pixels;
    while(new_h >= h(new_index))
        % If so increment the new_index to a new value.
        new_index = new_index+1;
        count = 0;
        new_h = count/total_num_of_pixels;
    end
    
end

end

