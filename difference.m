function Diff = difference(DATA,PARAMETRIC)
    [n,~] = size(DATA); % n is the number of parameters we compare to the original ones
    Diff = 0;
    for i=1:n
        Diff = Diff + abs(DATA(i)-PARAMETRIC(i));
    end
    Diff = Diff/n;
end