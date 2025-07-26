function seed = op_swap(tree,D)
temp = tree;
R = randperm(D);
T  = R(1:2);
S = fliplr(T);
temp(T) = temp(S);
seed = temp;
end
