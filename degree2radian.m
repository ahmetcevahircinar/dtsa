function [y] = degree2radian(x)
[~,D]=size(x');
PI = 3.141592;
for i=1:D   
    deg = round(x(i));
    min = x(i)- deg;
    rad(i) = PI * (deg + 5.0 * min/ 3.0) / 180.0;    
end
y=rad;
end

