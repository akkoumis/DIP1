function h = pdf2hist(d, f)
%PDF2HIST - Approximate histogram from a Probability Density Function 
%   Given the bins and the PDF, we can consrtuct the histogram. All we have
%   to do is integrate the PDF between the edges of the bin, so we can
%   calculate its height. In this function we use a typical arithmetic
%   integration method, the trapezoidal rule, to calculate the result. For
%   that purpose, we brake down the bin, using the step variable, and apply
%   the rule to each chunk. Using the sum_trap variable, we add together
%   all the result, thus having the height of the bin.
%   d is a vector representing the bins, basically the broken down x-axis.
%   f is a function pointer that returns the result of the PDF, on a given the x.   

n = length(d)-1;
h = zeros(n,1);
step = 0.0001;

for i=1:n
    x = d(i):step:d(i+1); % Divide x axis.
    y = arrayfun(f,x); % Calculate y axis, for every x value.
    
    sum_trap=0;
    for j=1:length(x)-1
       sum_trap = sum_trap + (y(j) + y(j+1))/2*(x(j+1)-x(j)); % Trapezoidal rule. 
    end

    h(i) = sum_trap;
    
end
fprintf("Sum before normalization = %f.\n",sum(h)); % Print the sum before normalization, to view the integration error.
h = h / sum(h); % Normalize the result

end

