function Diff = difference_first5(DATA,PARAMETRIC)
    [n,~] = size(DATA); % n is the number of parameters we compare to the original ones
    loop = min(5,n);
    Diff = 0;
    for i=1:loop
        Diff = Diff + abs(DATA(i)-PARAMETRIC(i));
    end
    Diff = Diff/5;
end