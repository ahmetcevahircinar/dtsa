function seed = op_symmetry(tree,D)
temp1 = tree;
temp2 = tree;
b  = ceil(1+(D-2)*rand);
R2 = ceil(1+(b-2)*rand);
R3 = ceil(1+(D-b-1)*rand);
a  = min(R2,R3);
if b + 1 <=D && b + a <=D
    temp1(b+1:b+a) = temp2(b-1:-1:b-a);
    temp1(b-1:-1:b-a) = temp2(b+1:b+a);
end
seed = temp1;
end