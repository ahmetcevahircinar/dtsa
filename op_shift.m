function seed = op_shift(tree,D)
temp = tree;
a  = ceil(1+(D-1)*rand);
b  = ceil(1+(D-1)*rand);
if a < b
    temp(a:b) = temp([a+1:b,a]);
else
    temp(b:a) = temp([b+1:a,b]);
end
seed = temp;
end
